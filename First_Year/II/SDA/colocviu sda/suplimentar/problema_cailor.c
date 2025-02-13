#include <stdio.h>
#include <stdlib.h>

#define N 8 // Size of the chessboard

int isSafe(int board[N][N], int row, int col) {
    // Check if the current position is safe for a knight
    static int rowMoves[] = { -2, -1, 1, 2, 2, 1, -1, -2 };
    static int colMoves[] = { 1, 2, 2, 1, -1, -2, -2, -1 };

    for (int i = 0; i < 8; i++) {
        int newRow = row + rowMoves[i];
        int newCol = col + colMoves[i];

        if (newRow >= 0 && newRow < N && newCol >= 0 && newCol < N && board[newRow][newCol] == 1) {
            return 0; // Knight is attacking another knight
        }
    }

    return 1; // Knight is safe to be placed
}

void solveKnights(int board[N][N], int row, int col, int knightsPlaced) {
    if (knightsPlaced == N) {
        // All knights have been placed, solution found
        printf("Solution found:\n");
        printBoard(board);
        printf("\n");
        return;
    }

    for (int i = row; i < N; i++) {
        for (int j = (i == row ? col : 0); j < N; j++) {
            if (isSafe(board, i, j)) {
                board[i][j] = 1; // Place the knight

                solveKnights(board, i, j + 1, knightsPlaced + 1);

                board[i][j] = 0; // Backtrack and remove the knight
            }
        }
    }
}

void printBoard(int board[N][N]) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            printf("%2d ", board[i][j]);
        }
        printf("\n");
    }
}

int main() {
    int board[N][N] = { 0 };

    solveKnights(board, 0, 0, 0);

    return 0;
}
