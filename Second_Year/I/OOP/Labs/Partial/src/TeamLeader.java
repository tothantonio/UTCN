class TeamLeader extends Angajat {
    private static final int BONUS_NIVEL = 200;

    public TeamLeader(String nume, int varsta, int aniExperienta, double tarifPerOra) {
        super(nume, varsta, aniExperienta, tarifPerOra);
    }

    public double calculeazaSalariu(int nrOreLucrate) {
        return tarifPerOra * nrOreLucrate + BONUS_NIVEL;
    }
}
