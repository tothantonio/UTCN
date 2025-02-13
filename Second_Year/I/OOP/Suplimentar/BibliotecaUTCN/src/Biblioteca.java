public class Biblioteca {
    private Carte[] carti;
    private Angajat[] angajati;
    private Student[] studenti;
    private Imprumut[] imprumuturi;
    private int numarCarti = 0;
    private int numarAngajati = 0;
    private int numarStudenti = 0;
    private int numarImprumuturi = 0;


    public Biblioteca(int maxCarti, int maxAngajati, int maxStudenti, int maxImprumuturi) {
        carti = new Carte[maxCarti];
        angajati = new Angajat[maxAngajati];
        studenti = new Student[maxStudenti];
        imprumuturi = new Imprumut[maxImprumuturi];
    }

    public void adaugaCarte(String nume, String editura){
        carti[numarCarti++] = new Carte(nume, editura);
    }

    public void adaugaAngajati(String nume, String functie){
        angajati[numarAngajati++] = new Angajat(numarAngajati + 1, nume,  functie, 10);
    }

    public void adaugaStudenti(String nume){
        studenti[numarStudenti++] = new Student(numarStudenti + 1, nume, 10);
    }

    public void adaugaImprumuturi(Persoana persoana, Carte carte, Angajat angajat){
        imprumuturi[numarImprumuturi++] = new Imprumut(persoana, carte, angajat);
    }

    public void listareAngajatiCartiImprumutate() {
        for(int i = 0; i < numarAngajati; i++){
            if(angajati[i].getNumarCarti() > 0){
                System.out.println(angajati[i]);
            }
        }
    }

    public Carte gasesteCarte(int id){
        for(int i = 0; i < numarCarti; i++){
            if(carti[i].getId() == id){
                return carti[i];
            }
        }
        return null;
    }

    public Student gasesteStudent(int id){
        for(int i = 0; i < numarStudenti; i++){
            if(studenti[i].getId() == id){
                return studenti[i];
            }
        }
        return null;
    }

    public Persoana gasestePersoana(int id){
        for(int i = 0; i < numarAngajati; i++){
            if(angajati[i].getId() == id){
                return angajati[i];
            }
        }
        for(int i = 0; i < numarStudenti; i++){
            if(studenti[i].getId() == id){
                return studenti[i];
            }
        }
        return null;
    }

    public double medieAritmeticaPerPersoana(){
        int totalCarti = 0;
        int totalPersoane = numarAngajati + numarStudenti;

        for(int i = 0; i < numarAngajati; i++){
            totalCarti += angajati[i].getNumarCarti();
        }
        for(int i = 0 ; i < numarStudenti; i++){
            totalCarti += studenti[i].getNumarCarti();
        }
        return totalPersoane > 0 ? (double) totalCarti / totalPersoane : 0;
    }

    public void celeMaiMulteCartiImprumutate() {
        Persoana persoanaMax = null;
        int maxCarti = 0;
        for(int i = 0; i < numarAngajati; i++){
            if(angajati[i].getNumarCarti() > maxCarti){
                maxCarti = angajati[i].getNumarCarti();
                persoanaMax = angajati[i];
            }
        }

        for(int i = 0; i < numarStudenti; i++){
            if(studenti[i].getNumarCarti() > maxCarti){
                maxCarti = studenti[i].getNumarCarti();
                persoanaMax = studenti[i];
            }
        }

        if(persoanaMax != null){
            System.out.println("Persoana cu cele mai multe carti imprumutate: " + persoanaMax);
        } else {
            System.out.println("Nu exista persoane cu carti imprumutate");
        }
    }


}
