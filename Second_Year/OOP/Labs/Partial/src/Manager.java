public class Manager extends Angajat {
    private static final int BONUS_NIVEL = 300;

    public Manager(String nume, int varsta, int aniExperienta, double tarifPerOra) {
        super(nume, varsta, aniExperienta, tarifPerOra);
    }

    public double calculeazaSalariu(int nrOreLucrate) {
        return tarifPerOra * nrOreLucrate + BONUS_NIVEL;
    }
}