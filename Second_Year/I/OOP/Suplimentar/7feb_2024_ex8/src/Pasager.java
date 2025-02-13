public class Pasager {
    private Document document;
    private int row;
    private int col;

    public Pasager(Document document, int row, int col) {
        this.document = document;
        this.row = row;
        this.col = col;
    }

    public int getRow() {
        return row;
    }

    public int getCol() {
        return col;
    }

    public Document getDocument() {
        return document;
    }
}
