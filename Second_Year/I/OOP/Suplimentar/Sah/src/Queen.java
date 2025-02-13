import static java.lang.Math.abs;

public class Queen extends Piesa{
    public Queen(String culoare){
        super(culoare);
    }

    public boolean validMove(int startx, int starty, int endx, int endy, Piesa[][] tabla){
        int dx = abs(startx - endx);
        int dy = abs(starty - endy);
        return(dx == dy || startx == endx || starty == endy);
    }
}
