public class Matrix {
    private Numeric[][] matrix;
    private int rows;
    private int cols;

    public Matrix(int rows, int cols) {
        this.rows = rows;
        this.cols = cols;
        this.matrix = new Numeric[rows][cols];
    }

    public void setElement(int i, int j, Numeric element) {
        this.matrix[i][j] = element;
    }

    public Numeric getElement(int i, int j) {
        return this.matrix[i][j];
    }

    public Matrix add(Matrix m) {
        Matrix result = new Matrix(this.rows, this.cols);
        for(int i = 0; i < this.rows; i++) {
            for(int j = 0; j < this.cols; j++) {
                result.setElement(i, j, this.matrix[i][j].add(m.getElement(i, j)));
            }
        }
        return result;
    }

    public Matrix subtract(Matrix m) {
        Matrix result = new Matrix(this.rows, this.cols);
        for(int i = 0; i < this.rows; i++) {
            for(int j = 0; j < this.cols; j++) {
                result.setElement(i, j, this.matrix[i][j].subtract(m.getElement(i, j)));
            }
        }
        return result;
    }

    public Matrix multiply(Matrix m) {
        Matrix result = new Matrix(this.rows, m.cols);
        for(int i = 0; i < this.rows; i++) {
            for(int j = 0; j < m.cols; j++) {
                Numeric sum = new Complex(0, 0);
                for(int k = 0; k < this.cols; k++) {
                    sum = sum.add(this.matrix[i][k].multiply(m.getElement(k, j)));
                }
                result.setElement(i, j, sum);
            }
        }
        return result;
    }

    public Matrix multiply(double scalar) {
        Matrix result = new Matrix(this.rows, this.cols);
        for(int i = 0; i < this.rows; i++) {
            for(int j = 0; j < this.cols; j++) {
                result.setElement(i, j, this.matrix[i][j].multiply(new Fractie(scalar)));
            }
        }
        return result;
    }

    public String toString() {
        String result = "";
        for(int i = 0; i < this.rows; i++) {
            for(int j = 0; j < this.cols; j++) {
                result += matrix[i][j].toString() + " ";
            }
            result += "\n";
        }
        return result;
    }
}
