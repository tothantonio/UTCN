public class Angajat {
    public static final String COMPANIE;
    public static int ANGAJATI;

    static{
        COMPANIE = "microsoft";
    }

    private String nume;
    private int anulNasterii;
    private byte aniExperienta = 2;

    public Angajat(String nume, int anulNasterii){
        this.nume = nume;
        this.anulNasterii = anulNasterii;
        ANGAJATI++;
    }

    public Angajat(){
        this("necunoscut", 1900);
    }

    public void setAniExperienta(double x){
        aniExperienta = (byte)x;
    }

    public byte getAniExperienta(){
        return aniExperienta;
    }

    public static String getCompanie(){
        return COMPANIE;
    }

    public String detaliiAngajat(){
        return "Angajat " + nume+", anul nasterii "+anulNasterii+ ", experienta "+aniExperienta+" ani";
    }
}
