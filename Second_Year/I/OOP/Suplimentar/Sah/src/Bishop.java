import static java.lang.Math.abs;

public class Bishop extends Piesa{
    public Bishop(String culoare){
        super(culoare);
    }
    public boolean validMove(int startx, int starty, int endx, int endy, Piesa[][] tabla){
        int dx = abs(startx - endx);
        int dy = abs(starty - endy);
        return (dx == dy);
    }
}
