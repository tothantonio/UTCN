import java.util.Scanner;

public class GoldbachConjecture {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("m: ");
        int m = scanner.nextInt();

        System.out.print("n:");
        int n = scanner.nextInt();

        scanner.close();

        checkGoldbachConjecture(m, n);
    }

    public static void checkGoldbachConjecture(int m, int n) {
        for (int evenNum = m; evenNum <= n; evenNum += 2) {
            boolean found = false;

            for (int prime = 2; prime <= evenNum / 2; prime++) {
                if (isPrime(prime) && isPrime(evenNum - prime)) {
                    found = true;
                    System.out.println(evenNum + " = " + prime + " + " + (evenNum - prime));
                    break;
                }
            }

            if (!found) {
                System.out.println("Goldbach's conjecture is false for " + evenNum);
            }
        }
    }

    public static boolean isPrime(int num) {
        if (num <= 1) {
            return false;
        }
        if (num <= 3) {
            return true;
        }
        if (num % 2 == 0 || num % 3 == 0) {
            return false;
        }

        for (int i = 5; i * i <= num; i += 6) {
            if (num % i == 0 || num % (i + 2) == 0) {
                return false;
            }
        }

        return true;
    }
}