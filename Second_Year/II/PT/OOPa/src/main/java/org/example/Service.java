package org.example;

import java.util.*;
import java.util.stream.Collectors;

public class Service extends Observable {
    private HashMap<Angajat, ArrayList<InterventieAuto>> mapReparatii = new HashMap<>();

    public void addInterventie(Angajat a, InterventieAuto interventie){
        mapReparatii.computeIfAbsent(a, i -> new ArrayList<>()).add(interventie);
    }

    public List<InterventieAuto> getInterventiiAngajat(int idAngajat) {

        return mapReparatii
                .entrySet()
                .stream()
                .filter(e->e.getKey().idAngajat() == idAngajat)
                .flatMap(e->e.getValue()
                        .stream())
                .toList();
    }

    public String getMarcaDupaReparatii(){
        return mapReparatii.values().stream()
                .flatMap(List::stream)
                .collect(Collectors.groupingBy(InterventieAuto::getMarca, Collectors.counting()))
                .entrySet().stream()
                .max(Map.Entry.comparingByValue())
                .map(Map.Entry::getKey)
                .orElse(null);
    }


}