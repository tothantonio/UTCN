public abstract class ContBancar implements Comparable {
    private String numeTitular;
    int sold;
    public ContBancar(String numeTitular) {
        this.numeTitular = numeTitular;
        sold = 0;
    }

    public void depune(int suma) {
        sold += suma;
    }

    public void retrage(int suma) throws Exception{
        if(suma > sold) {
            throw new Exception("Retragere " + suma + " - Fonduri insuficiente! - " + toString());
        }
        sold -= suma;
    }

    public String toString() {
        return "Cont bancar: sold = " + sold + ", titular=" + numeTitular;
    }

    public int compareTo(Object obj) {
        return Integer.compare(((ContBancar)obj).sold, sold);
    }
}
