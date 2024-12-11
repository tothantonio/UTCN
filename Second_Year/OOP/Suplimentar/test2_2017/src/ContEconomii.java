public class ContEconomii extends ContBancar{
    int procentDobanda;
    public ContEconomii(String numeTitular, int procentDobanda) {
        super(numeTitular);
        this.procentDobanda = procentDobanda;
    }

    public void acordaDobanda() {
        sold = (100 + procentDobanda) * sold / 100;
    }

    public String toString() {
        return super.toString() + ", tip cont=economii";
    }
}
