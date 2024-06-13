#include <stdio.h>
#include <stdlib.h>

typedef struct {
    int row;
    int col;
    int value;
} MatrixElement;

typedef struct {
    int rows;
    int cols;
    int numElements;
    MatrixElement* elements;
} SparseMatrix;

SparseMatrix readSparseMatrix() {
    int rows, cols, numElements;
    scanf_s("%d %d %d", &rows, &cols, &numElements);

    SparseMatrix matrix;
    matrix.rows = rows;
    matrix.cols = cols;
    matrix.numElements = numElements;
    matrix.elements = (MatrixElement*)malloc(numElements * sizeof(MatrixElement));

    for (int i = 0; i < numElements; i++) {
        scanf_s("(%d, %d, %d)", &matrix.elements[i].row, &matrix.elements[i].col, &matrix.elements[i].value);
    }

    return matrix;
}

SparseMatrix addSparseMatrices(SparseMatrix matrix1, SparseMatrix matrix2) {
    int maxSize = matrix1.numElements + matrix2.numElements;
    SparseMatrix result;
    result.rows = matrix1.rows;
    result.cols = matrix1.cols;
    result.elements = (MatrixElement*)malloc(maxSize * sizeof(MatrixElement));

    int i = 0, j = 0, k = 0;
    while (i < matrix1.numElements && j < matrix2.numElements) {
        if (matrix1.elements[i].row < matrix2.elements[j].row ||
            (matrix1.elements[i].row == matrix2.elements[j].row && matrix1.elements[i].col < matrix2.elements[j].col)) {
            result.elements[k++] = matrix1.elements[i++];
        }
        else if (matrix1.elements[i].row > matrix2.elements[j].row ||
            (matrix1.elements[i].row == matrix2.elements[j].row && matrix1.elements[i].col > matrix2.elements[j].col)) {
            result.elements[k++] = matrix2.elements[j++];
        }
        else {
            result.elements[k].row = matrix1.elements[i].row;
            result.elements[k].col = matrix1.elements[i].col;
            result.elements[k++].value = matrix1.elements[i++].value + matrix2.elements[j++].value;
        }
    }

    while (i < matrix1.numElements) {
        result.elements[k++] = matrix1.elements[i++];
    }

    while (j < matrix2.numElements) {
        result.elements[k++] = matrix2.elements[j++];
    }

    result.numElements = k;
    return result;
}

void printSparseMatrix(SparseMatrix matrix) {
    printf("%d %d %d\n", matrix.rows, matrix.cols, matrix.numElements);
    for (int i = 0; i < matrix.numElements; i++) {
        printf("(%d, %d, %d)\n", matrix.elements[i].row, matrix.elements[i].col, matrix.elements[i].value);
    }
}

void freeSparseMatrix(SparseMatrix matrix) {
    free(matrix.elements);
}

int main() {
    SparseMatrix matrix1, matrix2;
    char operation;

    while (scanf_s(" %c", &operation, sizeof(operation)) != EOF) {
        switch (operation) {
        case 'm':
            matrix1 = readSparseMatrix();
            break;
        case '+':
            matrix2 = readSparseMatrix();
            SparseMatrix result = addSparseMatrices(matrix1, matrix2);
            printSparseMatrix(result);
            freeSparseMatrix(result);
            break;
        default:
            break;
        }
    }

    freeSparseMatrix(matrix1);
    freeSparseMatrix(matrix2);

    return 0;
}
