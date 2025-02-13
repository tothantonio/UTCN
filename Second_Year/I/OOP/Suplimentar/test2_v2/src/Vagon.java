public abstract class Vagon implements Comparable {
    private String identificator;
    public Vagon(String identificator) {
        this.identificator = identificator;
    }

    public String getIdentificator() {
        return identificator;
    }

    public String toString() {
        return "Vagon: " + "ID=" + identificator + " Tip:" + getClass().getName();
    }

    public int compareTo(Object obj) {
        return ((Vagon)obj).getIdentificator().compareTo(identificator);
    }
}
