import java.util.Scanner;

public class ConsoaneVocale {

    public static boolean esteVocala(char c) {
        return "AEIOUaeiou".indexOf(c) != -1;
    }

    public static void numaraConsoaneVocale(String text) {
        int numarVocale = 0, numarConsoane = 0;

        for (int i = 0; i < text.length(); i++) {
            char c = text.charAt(i);
            if (Character.isLetter(c)) {
                if (esteVocala(c)) {
                    numarVocale++;
                } else {
                    numarConsoane++;
                }
            }
        }

        System.out.println("nr de vocale: " + numarVocale);
        System.out.println("nr de consoane: " + numarConsoane);
    }

    public static void gasesteIndiciVocale(String text, char vocala) {
        System.out.println("Indicii pentru vocala " + vocala + " in textul dat:");

        boolean gasit = false;
        for (int i = 0; i < text.length(); i++) {
            if (text.charAt(i) == vocala) {
                System.out.print(i + " ");
                gasit = true;
            }
        }

        if (!gasit) {
            System.out.println("Vocala nu a fost gasita in text.");
        } else {
            System.out.println();
        }
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("introdu un sir");
        String text = scanner.nextLine();
        numaraConsoaneVocale(text);

        System.out.println("zi o vocala:");
        char vocala = scanner.next().charAt(0);

        gasesteIndiciVocale(text, vocala);

        scanner.close();
    }
}
