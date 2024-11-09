public abstract class Carte {
    String titlu;
    String autor;

    public Carte(String titlu, String autor) {
        this.titlu = titlu;
        this.autor = autor;
    }

    public abstract String getTip();
}
