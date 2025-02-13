public class TablaSah {
    private Piesa[][] tabla;

    public TablaSah() {
        tabla = new Piesa[8][8];
        initializare();
    }

    private void initializare() {
        tabla[0][0] = new Rook("alb");
        tabla[0][1] = new Knight("alb");
        tabla[0][2] = new Bishop("alb");
        tabla[0][3] = new Queen("alb");
        tabla[0][4] = new King("alb");
        tabla[0][5] = new Bishop("alb");
        tabla[0][6] = new Knight("alb");
        tabla[0][7] = new Rook("alb");

        for(int i = 0; i < 8; i ++){
            tabla[1][i] = new Pawn("alb");
        }

        tabla[7][0] = new Rook("negru");
        tabla[7][1] = new Knight("negru");
        tabla[7][2] = new Bishop("negru");
        tabla[7][3] = new Queen("negru");
        tabla[7][4] = new King("negru");
        tabla[7][5] = new Bishop("negru");
        tabla[7][6] = new Knight("negru");
        tabla[7][7] = new Rook("negru");

        for(int i = 0; i < 8; i++){
            tabla[6][i] = new Pawn("negru");
        }
    }

    public void afisareTabla(){
        for(int i = 7; i >= 0; i--){
            for(int j = 0; j < 8; j++){
                Piesa p = tabla[i][j];
                if(p != null){
                    System.out.print(p.getCuloare().charAt(0) + p.getClass().getSimpleName().substring(0, 1) + " ");
                } else{
                    System.out.print(".  ");
                }
            }
            System.out.println();
        }
        System.out.println();
    }

    public boolean mutarePiesa(int startx, int starty, int endx, int endy){
        Piesa p = tabla[startx][starty];
        if(p.validMove(startx, starty, endx, endy, tabla)){
            System.out.println("Mutare invalida pentru piesa selectata.");
        }
        if (tabla[endy][endx] != null && tabla[endy][endx].getCuloare().equals(p.getCuloare())) {
            System.out.println("Nu poți captura propria piesă.");
            return false;
        }
        tabla[endy][endx] = p;
        tabla[starty][startx] = null;
        return true;
    }
}
