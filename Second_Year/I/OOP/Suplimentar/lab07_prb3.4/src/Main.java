import java.util.Arrays;

public class Main {
    public static void main(String[] args) {
        Persoana[] persoane = new Persoana[3];
        persoane[0] = new Persoana("Emil", "Gabriel", 20);
        persoane[1] = new Persoana("Ana", "Bogdan", 30);
        persoane[2] = new Persoana("Gica", "Gabriel", 13);

        Arrays.sort(persoane);

        for(Persoana p : persoane) {
            System.out.println(p);
        }
    }
}