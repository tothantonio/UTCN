public class Loc {
    private Pasager pasager;

    public boolean esteLiber() {
        return pasager == null;
    }

    public void ocupa(Pasager pasager) throws Exception {
        if(!esteLiber()) {
            throw new Exception("Locul este ocupat");
        }
        this.pasager = pasager;
    }
}
