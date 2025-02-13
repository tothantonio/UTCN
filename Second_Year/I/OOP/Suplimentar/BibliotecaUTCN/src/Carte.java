public class Carte {
    private static int counter = 0;
    private int id;
    private String nume;
    private String editura;

    public Carte(String nume, String editura) {
        this.id = ++ counter;
        this.nume = nume;
        this.editura = editura;
    }

    public int getId() {return id;}
    public String getNume() {return nume;}
    public String getEditura() { return editura;}
    public String toString() {
        return "Carte [id = " + id + ", nume = " + nume + ", editura = " + editura + "]";
    }
}
