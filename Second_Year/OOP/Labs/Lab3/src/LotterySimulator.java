import java.util.Random;

public class LotterySimulator {
    public static void main(String[] args) {
        int totalNumbers = 49;
        int numbersToChoose = 6;
        int[] lotteryNumbers = generateRandomNumbers(totalNumbers, numbersToChoose);

        System.out.println("Lottery Numbers (6 out of 49): ");
        printArray(lotteryNumbers);

        System.out.println("Sorted Lottery Numbers: ");
        ordonare(lotteryNumbers);
    }

    private static int[] generateRandomNumbers(int totalNumbers, int numbersToChoose) {
        int[] lotteryNumbers = new int[numbersToChoose];
        Random random = new Random();

        for (int i = 0; i < numbersToChoose; i++) {
            int randomNum;
            do {
                randomNum = random.nextInt(totalNumbers) + 1;
            } while (contains(lotteryNumbers, randomNum));

            lotteryNumbers[i] = randomNum;
        }

        return lotteryNumbers;
    }

    private static boolean contains(int[] array, int value) {
        for (int num : array) {
            if (num == value) {
                return true;
            }
        }
        return false;
    }

    private static void printArray(int[] array) {
        for (int num : array) {
            System.out.print(num + " ");
        }
        System.out.println();
    }

    private static void ordonare(int[] array) {
        long sorted = 0;

        for (int num : array) {
            sorted = sorted | (1L << num);
        }
        for (int i = 1; i <= 49; i++) {
            if ((sorted & (1L << i)) != 0) {
                System.out.print(i + " ");
            }
        }
        System.out.println();
    }
}
