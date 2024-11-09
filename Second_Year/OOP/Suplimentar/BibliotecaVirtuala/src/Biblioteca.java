public class Biblioteca {
    private Carte[] carti;
    private int nrCarti;

    public Biblioteca() {
        this.carti = new Carte[100];
        this.nrCarti = 0;
    }

    public void addCarte(Carte carte) {
       if(nrCarti < carti.length) {
           carti[nrCarti] = carte;
           nrCarti++;
       }
    }

    public void listCarti() {
        for(int i = 0; i < carti.length; i++) {
            if(carti[i] != null) {
                System.out.println(carti[i].titlu + " - " + carti[i].autor + " - " + carti[i].getTip());
            }
        }
    }

    public int getNrCarti(){
        return nrCarti;
    }

    public int getNrCartiBeletristica() {
        int count = 0;
        for (int i = 0; i < nrCarti; i++) {
            if (carti[i].getTip().equals("Carte Beletristica")) {
                count++;
            }
        }
        return count;
    }

    public int getNrCartiStiinta() {
        int count = 0;
        for (int i = 0; i < nrCarti; i++) {
            if (carti[i].getTip().equals("Carte Stiintifica")) {
                count++;
            }
        }
        return count;
    }
}
