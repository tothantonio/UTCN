import java.util.Random;

public class Matrice {
    private Complex[][] matrix;

    public Matrice(int nrLinii , int nrCol) {
        this.matrix = new Complex[nrLinii][nrCol];
        for(int i = 0; i < nrLinii; i++){
            for(int j = 0; j < nrCol; j++){
                this.matrix[i][j] = new Complex(new Random().nextInt(10), new Random().nextInt(10));
            }
        }
    }

    public void afisareMatrice(){
        for(int i = 0; i < this.matrix.length; i++){
            for(int j = 0; j < this.matrix[i].length; j++){
                System.out.print(this.matrix[i][j] + " ");
            }
            System.out.println();
        }
        System.out.println();
    }

    public Complex getElement(int i, int j){
        return this.matrix[i][j];
    }

    public void adunareMatrice(Matrice matrice){
        for(int i = 0; i < this.matrix.length; i++){
            for(int j = 0; j < this.matrix[i].length; j++){
                this.matrix[i][j].adunare(matrice.getElement(i, j));
            }
        }
    }

    public void scadereMatrice(Matrice matrice){
        for(int i = 0; i < this.matrix.length; i++){
            for(int j = 0; j < this.matrix[i].length; j++){
                this.matrix[i][j].scadere(matrice.getElement(i, j));
            }
        }
    }

    public void inmultire(Matrice matrice){

        Matrice rez = new Matrice(matrix.length, matrix[0].length);

        for(int i = 0; i < rez.matrix.length; i++){
            for(int j = 0; j < rez.matrix[i].length; j++){
                rez.matrix[i][j] = new Complex(0, 0);
            }
        }
    }
}
