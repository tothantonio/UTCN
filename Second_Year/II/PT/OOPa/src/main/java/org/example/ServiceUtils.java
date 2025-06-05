package org.example;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class ServiceUtils {
    public Map<Angajat, List<ReparatieAuto>> angajatiCuReparatii(Map<Angajat, List<InterventieAuto>> map){
        return map.entrySet().stream()
                .collect(Collectors.toMap(
                        Map.Entry::getKey,
                        e->e.getValue().stream()
                                .filter(i-> i instanceof ReparatieAuto)
                                .map(i -> (ReparatieAuto)i)
                                .filter(r -> r.cost() > 5000)
                                .toList()
                ));
    }

    public List<String> masiniFaraITP(Map<Angajat, List<InterventieAuto>> map){
        return map.values().stream()
                .flatMap(List::stream)
                .filter(i-> i instanceof InspectieTehnicaPeriodica)
                .map(i->(InspectieTehnicaPeriodica)i)
                .filter(i->!"Passed".equalsIgnoreCase(i.getRezultatEvaluare()))
                .map(i->i.nrInmatriculareMasina)
                .distinct()
                .toList();
    }
}
