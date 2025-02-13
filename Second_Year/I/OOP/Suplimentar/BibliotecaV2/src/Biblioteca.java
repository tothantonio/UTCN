public class Biblioteca {
    static final int MAX_CARTI = 100;
    private Carte[] carti = new Carte[MAX_CARTI];

    public Biblioteca() {}

    public void addCarte(Carte carte) {
        for(int i = 0; i < MAX_CARTI; i++) {
            if(carti[i] == null) {
                carti[i] = carte;
                return;
            }
        }
    }

    public void listeazaCarti() {
        for(int i = 0; i < MAX_CARTI; i++) {
            if(carti[i] != null) {
                System.out.println(carti[i]);
            }
        }
    }

    public Carte gasesteCarteDupaTitlu(String titlu) {
        for(int i = 0; i < MAX_CARTI; i++) {
            if(carti[i] != null && carti[i].getTitlu().equals(titlu)) {
                return carti[i];
            }
        }
        return null;
    }
}
