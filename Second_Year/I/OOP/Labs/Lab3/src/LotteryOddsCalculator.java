import java.math.BigDecimal;

public class LotteryOddsCalculator {
    public static void main(String[] args) {
        int totalNumbers = 49;
        int numbersToChoose = 6;

        BigDecimal odds = calculateOdds(totalNumbers, numbersToChoose);
        BigDecimal A = BigDecimal.ONE.divide(odds, 10, BigDecimal.ROUND_HALF_UP);
        System.out.println(A);
    }

    private static BigDecimal calculateOdds(int n, int k){
        BigDecimal numarator = factorial(n);
        BigDecimal numitor = factorial(k).multiply(factorial((n - k)));
        return numarator.divide((numitor));
    }

    private static BigDecimal factorial(int n){
        BigDecimal result = BigDecimal.ONE;

        for(int i = 1; i <= n; i++){
            result = result.multiply(BigDecimal.valueOf(i));
        }
        return result;
    }
}
