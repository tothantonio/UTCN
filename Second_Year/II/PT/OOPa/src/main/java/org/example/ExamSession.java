package org.example;

import java.time.LocalDate;
import java.util.Date;

public sealed class ExamSession permits WrittenExam, OralExam{
    private int duration;
    private String subject;
    private LocalDate dateTime;

    public ExamSession(int duration, String subject, LocalDate dateTime){
        this.duration = duration;
        this.subject = subject;
        this.dateTime = dateTime;
    }

    public LocalDate getDate(){return dateTime;}
    public String getSubject(){return subject;}
    public int getDuration(){return duration;}
}
