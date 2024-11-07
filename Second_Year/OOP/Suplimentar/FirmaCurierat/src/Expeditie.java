public class Expeditie {
    private static int uid = 0;
    private int sursa;
    private int destinatie;
    private int distanta;
    private Administrator administrator;
    private Utilizator utilizator;

    public Expeditie(int uid, int sursa, int destinatie, int distanta, Administrator administrator, Utilizator utilizator) {
        this.uid = ++uid;
        this.sursa = sursa;
        this.destinatie = destinatie;
        this.distanta = distanta;
        this.administrator = administrator;
        this.utilizator = utilizator;
    }

    public void setSursa(int sursa) {
        this.sursa = sursa;
    }

    public int getSursa() {
        return sursa;
    }

    public void setDestinatie(int destinatie) {
        this.destinatie = destinatie;
    }

    public int getDestinatie() {
        return destinatie;
    }

    public void setDistanta(int distanta) {
        this.distanta = distanta;
    }

    public int getDistanta() {
        return distanta;
    }

    public void setAdministrator(Administrator administrator) {
        this.administrator = administrator;
    }

    public Administrator getAdministrator() {
        return administrator;
    }

    public void setUtilizator(Utilizator utilizator) {
        this.utilizator = utilizator;
    }

    public Utilizator getUtilizator() {
        return utilizator;
    }

    public void afisare() {
        System.out.println("Expeditia de la " + sursa + " la " + destinatie + " are o distanta de " + distanta + " km");
    }

    public static void distantaMedie(Expeditie[] expeditii) {
        int suma = 0;
        for (int i = 0; i < expeditii.length; i++) {
            suma += expeditii[i].getDistanta();
        }
        System.out.println("Distanta medie a expeditiilor este " + suma / expeditii.length + " km");
    }


}
