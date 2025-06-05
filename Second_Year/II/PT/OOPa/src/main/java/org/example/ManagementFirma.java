package org.example;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ManagementFirma {
    Map<Departament, List<Employee>> map = new HashMap<>();

    public void addDepartament(Departament dep){
        map.put(dep, new ArrayList<>());
    }

    public void addEmployee(Employee e, Departament dep){
        if(map.containsKey(dep) == false){
            map.put(dep, new ArrayList<>());
        }
        map.get(dep).add(e);
        System.out.println("A fost introdus un: " + e.getClass().getSimpleName());
    }

    public static void addListaEmployee(Map<Departament, List<Employee>> map, Departament dep, List<? extends Employee> lista){
        map.get(dep).addAll(lista);
    }

//    public void salariuTotal(){
//        map.forEach((dep, employees) -> {
//            int total = employees.stream()
//                    .mapToInt(e -> e.getSalariu())
//                    .sum();
//            System.out.println("Departamentul: " + dep.getNume() + "are salariu: " + total);
//        });
//    }
}
