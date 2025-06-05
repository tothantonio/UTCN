package org.example;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
public class ExamManagementSystem {
    HashMap<Student, ArrayList<ExamSession>> session = new HashMap<>();
    private volatile boolean running = true;

    public ExamManagementSystem(){
        Thread thread = new Thread(() -> {
            while(running){
                try{
                    Thread.sleep(1000);
                    for(Student stud : session.keySet()){
                        int count = 0;
                        for(ExamSession exam : session.get(stud)){
                            if(exam.getDate().equals(LocalDate.of(2025, 6, 14))){
                                count ++;
                            }
                        }
                        if(count >= 3) {
                            System.out.println("Studentul: " + stud.getId() + " Nume: " + stud.getName() + " are " + count + " examene");
                        }
                    }
                }catch(InterruptedException e){
                    break;
                }
            }
        });
        thread.start();
    }

    public void stopThread(){running = false;}

    public void addStudent(Student s){
        if(session.containsKey(s) == false) {
            session.put(s, new ArrayList<>());
        }
    }

    public void addExamToStudent(Student s, ExamSession exam){
        if(session.containsKey(s)){
            session.get(s).add(exam);
        } else {
            addStudent(s);
            session.get(s).add(exam);
        }
    }

    public ArrayList<ExamSession> getExamsForStudent(Student s){
        return session.get(s);
    }

    public void displayStudentsWithLongerExams(){
        session.entrySet()
                .stream()
                .filter(e -> e.getValue()
                        .stream()
                        .anyMatch(
                        exam -> exam.getDuration() > 120
                ))
                .map(e -> e.getKey())
                .forEach(s -> System.out.println("Student: " + s.getName()));
    }

    public void sortStudent(){
        session.entrySet()
                .stream()
                .sorted((e1, e2) -> {
                    int total1 = e1.getValue().stream().mapToInt(e -> e.getDuration()).sum();
                    int total2 = e2.getValue().stream().mapToInt(e -> e.getDuration()).sum();
                    return Integer.compare(total2, total1);
                })
                .forEach(e -> System.out.println("Student: " + e.getKey().getName()
                        + " Total minute: " + e.getValue().stream().mapToInt(entry -> entry.getDuration()).sum()
                        ));
    }
}
