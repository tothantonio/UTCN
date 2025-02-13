import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        TicTacToe game = new TicTacToe();
        Scanner scanner = new Scanner(System.in);
        boolean gameWon = false;

        System.out.println("Welcome to Tic-Tac-Toe!");

        while (!gameWon && !game.isDraw()) {
            game.printBoard();
            System.out.println("Current player: " + game.currentPlayer);
            System.out.print("Enter row: ");
            int row = scanner.nextInt();
            System.out.print("Enter column: ");
            int col = scanner.nextInt();

            if (game.set(row, col)) {
                if (game.checkWinner()) {
                    game.printBoard();
                    System.out.println("Player " + game.currentPlayer + " wins!");
                    gameWon = true;
                } else if (game.isDraw()) {
                    game.printBoard();
                    System.out.println("The game is a draw!");
                } else {
                    game.switchPlayer();
                }
            } else {
                System.out.println("Invalid move, try again.");
            }
        }
        scanner.close();
    }
}