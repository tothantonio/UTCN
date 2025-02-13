public class ParcAuto {
    private Vehicul[] vehicule;
    private int nrVehicule;

    public ParcAuto() {
        vehicule = new Vehicul[100];
        nrVehicule = 0;
    }

    public void addVehicul(Vehicul vehicul) {
        vehicule[nrVehicule++] = vehicul;
    }

    public void listVehicule(){
        for (int i = 0; i < nrVehicule; i++) {
            System.out.println(vehicule[i].getTip() + " cu numarul de inmatriculare " + vehicule[i].numarInmatriculare);
        }
    }

    public int numarVehicule(){
        return nrVehicule;
    }

    public int numarMasini(){
        int nrMasini = 0;
        for (int i = 0; i < nrVehicule; i++) {
            if (vehicule[i] instanceof Masina) {
                nrMasini++;
            }
        }
        return nrMasini;
    }

    public int numarMotociclete(){
        int nrMotociclete = 0;
        for (int i = 0; i < nrVehicule; i++) {
            if (vehicule[i] instanceof Motocicleta) {
                nrMotociclete++;
            }
        }
        return nrMotociclete;
    }
}
