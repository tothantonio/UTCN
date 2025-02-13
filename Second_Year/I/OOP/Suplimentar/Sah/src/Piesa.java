public abstract class Piesa {
    protected String culoare;

    public Piesa(String culoare){
        this.culoare = culoare;
    }
    public String getCuloare(){
        return culoare;
    }
    public abstract boolean validMove(int startx, int starty, int endx, int endy, Piesa[][] tabla);
}
