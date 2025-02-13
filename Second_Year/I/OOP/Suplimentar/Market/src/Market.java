public class Market {
    private Produs[] produse;
    int nrProduse;

    public Market() {
        this.produse = new Produs[100];
        this.nrProduse = 0;
    }

    public void adaugaProdus(Produs produs) {
        this.produse[this.nrProduse] = produs;
        this.nrProduse++;
    }

    public void afiseazaProduse() {
        for(int i = 0; i < nrProduse; i++) {
            System.out.println(produse[i].getCategorie() + " " + produse[i].denumire + " " + produse[i].pret);
        }
    }

    public int totalProduse() {
        return nrProduse;
    }

    public int totalAliment() {
        int total = 0;
        for(int i = 0; i < nrProduse; i++) {
            if(produse[i] instanceof Aliment) {
                total++;
            }
        }
        return total;
    }

    public int totalElectrocasnic() {
        int total = 0;
        for(int i = 0; i < nrProduse; i++) {
            if(produse[i] instanceof Electrocasnic) {
                total++;
            }
        }
        return total;
    }
}
