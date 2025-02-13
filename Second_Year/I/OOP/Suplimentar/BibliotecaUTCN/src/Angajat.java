public class Angajat extends Persoana{
    private String functie;
    public Angajat(int id, String nume, String functie, int maxCarti){
        super(id, nume, maxCarti);
        this.functie = functie;
    }

    public String getFunctie(){ return functie; }
    public String toString(){
        return "Angajat [id = " + id + ", nume = " + nume + ", functie = " + functie + "]";
    }
}
