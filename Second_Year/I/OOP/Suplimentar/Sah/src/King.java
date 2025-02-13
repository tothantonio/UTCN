import static java.lang.Math.abs;

public class King extends Piesa {
    public King(String culoare){
        super(culoare);
    }
    public boolean validMove(int startx, int starty, int endx, int endy, Piesa[][] tabla){
        int dx = abs(startx - endx);
        int dy = abs(starty - endy);
        return (dx <= 1 && dy <= 1);
    }
}