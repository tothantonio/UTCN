import java.util.Scanner;

public class Main {
    public static void main(String[] args) throws Exception {
        Scanner scanner = new Scanner(System.in);

        int rows = scanner.nextInt();
        int cols = scanner.nextInt();
        Aeronava aeronava = new Aeronava(rows, cols);

        int n = scanner.nextInt();
        for(int i = 0; i < n; i++) {
            String nume = scanner.next();
            String cnp = scanner.next();
            String adresa = scanner.next();
            Ci ci = new Ci(nume, cnp, adresa);
            int row = scanner.nextInt();
            int col = scanner.nextInt();
            Pasager pasager = new Pasager(ci, row, col);
            aeronava.addPasager(pasager);
        }

        String judet = scanner.next();
        System.out.println(aeronava.pasageriDinJudet(judet));

        aeronava.printOrdineAlfabeticaNume();
    }
}
