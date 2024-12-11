public class ContCurent extends ContBancar{
    public ContCurent(String numeTitular) {
        super(numeTitular);
    }

    public String toString() {
        return super.toString() + ", tip cont=curent";
    }
}
