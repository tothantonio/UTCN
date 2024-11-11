public class Developer extends Angajat {
    private static final int BONUS_NIVEL = 100;
    private int nrTaskuriRezolvate;
    private String taskCurent;

    public Developer() {
        super();
        this.taskCurent = "Constructor Fara Parametrii";
    }

    public Developer(String nume, int varsta, int aniExperienta, double tarifPerOra, String taskCurent) {
        super(nume, varsta, aniExperienta, tarifPerOra);
        this.taskCurent = taskCurent;
    }

    public void rezolvaTask() {
        nrTaskuriRezolvate++;
        System.out.println(nume + " rezolva problema " + taskCurent);
    }

    public int getNrTaskuriRezolvate() {
        return nrTaskuriRezolvate;
    }

    public String getTaskCurent() {
        return taskCurent;
    }

    public double calculeazaSalariu(int nrOreLucrate) {
        return tarifPerOra * nrOreLucrate + BONUS_NIVEL;
    }
}