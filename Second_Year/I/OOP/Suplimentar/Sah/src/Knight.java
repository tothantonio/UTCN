import static java.lang.Math.abs;

public class Knight extends Piesa{
    public Knight(String culoare){
        super(culoare);
    }
    public boolean validMove(int startx, int starty, int endx, int endy, Piesa[][] tabla){
        int dx = abs(startx - endx);
        int dy = abs(starty - endy);
        return(dx == 2 && dy == 1) || (dx == 1 && dy == 2);
    }
}
