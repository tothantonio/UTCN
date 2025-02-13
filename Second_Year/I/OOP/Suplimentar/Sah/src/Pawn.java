import static java.lang.Math.abs;

public class Pawn extends Piesa{
    public Pawn(String culoare){
        super(culoare);
    }
    public boolean validMove(int startx, int starty, int endx, int endy, Piesa[][] tabla){
        int dx = abs(startx - endx);
        int dy = endy - starty;

        if(culoare.equals("alb")){
            return((dy == 1 && dx == 0) || (starty == 1 && dy == 2 && dx == 0));
        }else{
            return((dy == -1 && dx == 0) || (starty == 6 && dy == -2 && dx == 0));
        }
    }
}
