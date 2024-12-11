public class VagonCalatori extends Vagon{
    private int nrLocuri;
    public VagonCalatori(String identificator, int nrLocuri) {
        super(identificator);
        this.nrLocuri = nrLocuri;
    }

    public String toString() {
        return super.toString() + " Nr. locuri:" + nrLocuri;
    }
}
