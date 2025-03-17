//
//  mat4.h
//  Lab3_TODO
//
//  Copyright © 2016 CGIS. All rights reserved.
//

#pragma once

#include <algorithm>
#include <iostream>
#include "vec4.h"

namespace egc {
    class mat4 {
    public:
        //==============================================
        //matrixData is stored in column-major order
        //  m00  m04   m08  m12
        //  m01  m05   m09  m13
        //  m02  m06   m10  m14
        //  m03  m07   m11  m15
        //
        //  matrixData[] = {m00, m01, m02, m03,
        //                  m04, m05, m06, m07,
        //                  m08, m09, m10, m11,
        //                  m12, m13, m14, m15}
        //==============================================
        float matrixData[16];
        
        //==============================================
        //constructors
        //==============================================
        
        //default constructor creates an identity matrix
        mat4()
        {
            for (int i = 0; i < 16; i++) {
                matrixData[i] = (i % 5) ? 0.0f : 1.0f;
            }
        }
        
        mat4(const float* srcMatrix)
        {
            std::copy(srcMatrix, srcMatrix + 16, matrixData);
        }
        
        //==============================================
        // TO BE IMPLEMENTED
        //==============================================
        mat4& operator =(const mat4& srcMatrix) {
            for (int i = 0; i < 16; i++) {
                matrixData[i] = srcMatrix.matrixData[i];
            }

            return *this;
        }
        mat4 operator *(float scalarValue) const {
            mat4 result;
            for (int i = 0; i < 16; i++) {
                result.matrixData[i] = matrixData[i] * scalarValue;
            }
            return result;
        }
        mat4 operator *(const mat4& srcMatrix) const {
            mat4 result;
            for (int row = 0; row < 4; row++) {
                for (int col = 0; col < 4; col++) {
                    result.at(row, col) = 0;
                    for (int k = 0; k < 4; k++) {
                        result.at(row, col) += this->at(row, k) * srcMatrix.at(k, col);
                    }
                }
            }
            return result;
        }
        vec4 operator *(const vec4& srcVector) const {
            return vec4(
                at(0, 0) * srcVector.x + at(0, 1) * srcVector.y + at(0, 2) * srcVector.z + at(0, 3) * srcVector.w,
                at(1, 0) * srcVector.x + at(1, 1) * srcVector.y + at(1, 2) * srcVector.z + at(1, 3) * srcVector.w,
                at(2, 0) * srcVector.x + at(2, 1) * srcVector.y + at(2, 2) * srcVector.z + at(2, 3) * srcVector.w,
                at(3, 0) * srcVector.x + at(3, 1) * srcVector.y + at(3, 2) * srcVector.z + at(3, 3) * srcVector.w
            );
        }
        mat4 operator +(const mat4& srcMatrix) const {
            mat4 result;
            for (int i = 0; i < 16; i++) {
                result.matrixData[i] = matrixData[i] + srcMatrix.matrixData[i];
            }
            return result;
        }
        //get element by (row, column)
        float& at(int i, int j) {
            return matrixData[i + j * 4];
        }
        const float& at(int i, int j) const {
            return matrixData[i + j * 4];
        }
        float determinant() const {
            float det =
                at(0, 0) * (at(1, 1) * (at(2, 2) * at(3, 3) - at(2, 3) * at(3, 2)) -
                    at(1, 2) * (at(2, 1) * at(3, 3) - at(2, 3) * at(3, 1)) +
                    at(1, 3) * (at(2, 1) * at(3, 2) - at(2, 2) * at(3, 1))) -
                at(0, 1) * (at(1, 0) * (at(2, 2) * at(3, 3) - at(2, 3) * at(3, 2)) -
                    at(1, 2) * (at(2, 0) * at(3, 3) - at(2, 3) * at(3, 0)) +
                    at(1, 3) * (at(2, 0) * at(3, 2) - at(2, 2) * at(3, 0))) +
                at(0, 2) * (at(1, 0) * (at(2, 1) * at(3, 3) - at(2, 3) * at(3, 1)) -
                    at(1, 1) * (at(2, 0) * at(3, 3) - at(2, 3) * at(3, 0)) +
                    at(1, 3) * (at(2, 0) * at(3, 1) - at(2, 1) * at(3, 0))) -
                at(0, 3) * (at(1, 0) * (at(2, 1) * at(3, 2) - at(2, 2) * at(3, 1)) -
                    at(1, 1) * (at(2, 0) * at(3, 2) - at(2, 2) * at(3, 0)) +
                    at(1, 2) * (at(2, 0) * at(3, 1) - at(2, 1) * at(3, 0)));

            return det;
        }
        mat4 inverse() const {

            mat4 inv;
            float det = determinant();

            if (std::abs(det) < std::numeric_limits<float>::epsilon()) {
                throw std::runtime_error("Matrix is not invertible (determinant is zero).");
            }

            inv.matrixData[0] = (matrixData[5] * matrixData[10] * matrixData[15] + matrixData[6] * matrixData[11] * matrixData[13] + matrixData[7] * matrixData[9] * matrixData[14] - matrixData[7] * matrixData[10] * matrixData[13] - matrixData[6] * matrixData[9] * matrixData[15] - matrixData[5] * matrixData[11] * matrixData[14]) / det;
            inv.matrixData[1] = (-matrixData[1] * matrixData[10] * matrixData[15] - matrixData[2] * matrixData[11] * matrixData[13] - matrixData[3] * matrixData[9] * matrixData[14] + matrixData[3] * matrixData[10] * matrixData[13] + matrixData[2] * matrixData[9] * matrixData[15] + matrixData[1] * matrixData[11] * matrixData[14]) / det;
            inv.matrixData[2] = (matrixData[1] * matrixData[6] * matrixData[15] + matrixData[2] * matrixData[7] * matrixData[13] + matrixData[3] * matrixData[5] * matrixData[14] - matrixData[3] * matrixData[6] * matrixData[13] - matrixData[2] * matrixData[5] * matrixData[15] - matrixData[1] * matrixData[7] * matrixData[14]) / det;
            inv.matrixData[3] = (-matrixData[1] * matrixData[6] * matrixData[11] - matrixData[2] * matrixData[7] * matrixData[9] - matrixData[3] * matrixData[5] * matrixData[10] + matrixData[3] * matrixData[6] * matrixData[9] + matrixData[2] * matrixData[5] * matrixData[11] + matrixData[1] * matrixData[7] * matrixData[10]) / det;

            inv.matrixData[4] = (-matrixData[4] * matrixData[10] * matrixData[15] - matrixData[6] * matrixData[11] * matrixData[12] - matrixData[7] * matrixData[8] * matrixData[14] + matrixData[7] * matrixData[10] * matrixData[12] + matrixData[6] * matrixData[8] * matrixData[15] + matrixData[4] * matrixData[11] * matrixData[14]) / det;
            inv.matrixData[5] = (matrixData[0] * matrixData[10] * matrixData[15] + matrixData[2] * matrixData[11] * matrixData[12] + matrixData[3] * matrixData[8] * matrixData[14] - matrixData[3] * matrixData[10] * matrixData[12] - matrixData[2] * matrixData[8] * matrixData[15] - matrixData[0] * matrixData[11] * matrixData[14]) / det;
            inv.matrixData[6] = (-matrixData[0] * matrixData[6] * matrixData[15] - matrixData[2] * matrixData[7] * matrixData[12] - matrixData[3] * matrixData[4] * matrixData[14] + matrixData[3] * matrixData[6] * matrixData[12] + matrixData[2] * matrixData[4] * matrixData[15] + matrixData[0] * matrixData[7] * matrixData[14]) / det;
            inv.matrixData[7] = (matrixData[0] * matrixData[6] * matrixData[11] + matrixData[2] * matrixData[7] * matrixData[8] + matrixData[3] * matrixData[4] * matrixData[10] - matrixData[3] * matrixData[6] * matrixData[8] - matrixData[2] * matrixData[4] * matrixData[11] - matrixData[0] * matrixData[7] * matrixData[10]) / det;

            inv.matrixData[8] = (matrixData[4] * matrixData[9] * matrixData[15] + matrixData[5] * matrixData[11] * matrixData[12] + matrixData[7] * matrixData[8] * matrixData[13] - matrixData[7] * matrixData[9] * matrixData[12] - matrixData[5] * matrixData[8] * matrixData[15] - matrixData[4] * matrixData[11] * matrixData[13]) / det;
            inv.matrixData[9] = (-matrixData[0] * matrixData[9] * matrixData[15] - matrixData[1] * matrixData[11] * matrixData[12] - matrixData[3] * matrixData[8] * matrixData[13] + matrixData[3] * matrixData[9] * matrixData[12] + matrixData[1] * matrixData[8] * matrixData[15] + matrixData[0] * matrixData[11] * matrixData[13]) / det;
            inv.matrixData[10] = (matrixData[0] * matrixData[5] * matrixData[15] + matrixData[1] * matrixData[7] * matrixData[12] + matrixData[3] * matrixData[4] * matrixData[13] - matrixData[3] * matrixData[5] * matrixData[12] - matrixData[1] * matrixData[4] * matrixData[15] - matrixData[0] * matrixData[7] * matrixData[13]) / det;
            inv.matrixData[11] = (-matrixData[0] * matrixData[5] * matrixData[11] - matrixData[1] * matrixData[7] * matrixData[8] - matrixData[3] * matrixData[4] * matrixData[9] + matrixData[3] * matrixData[5] * matrixData[8] + matrixData[1] * matrixData[4] * matrixData[11] + matrixData[0] * matrixData[7] * matrixData[9]) / det;

            inv.matrixData[12] = (-matrixData[4] * matrixData[9] * matrixData[14] - matrixData[5] * matrixData[10] * matrixData[12] - matrixData[6] * matrixData[8] * matrixData[13] + matrixData[6] * matrixData[9] * matrixData[12] + matrixData[5] * matrixData[8] * matrixData[14] + matrixData[4] * matrixData[10] * matrixData[13]) / det;
            inv.matrixData[13] = (matrixData[0] * matrixData[9] * matrixData[14] + matrixData[1] * matrixData[10] * matrixData[12] + matrixData[2] * matrixData[8] * matrixData[13] - matrixData[2] * matrixData[9] * matrixData[12] - matrixData[1] * matrixData[8] * matrixData[14] - matrixData[0] * matrixData[10] * matrixData[13]) / det;
            inv.matrixData[14] = (-matrixData[0] * matrixData[5] * matrixData[14] - matrixData[1] * matrixData[6] * matrixData[12] - matrixData[2] * matrixData[4] * matrixData[13] + matrixData[2] * matrixData[5] * matrixData[12] + matrixData[1] * matrixData[4] * matrixData[14] + matrixData[0] * matrixData[6] * matrixData[13]) / det;
            inv.matrixData[15] = (matrixData[0] * matrixData[5] * matrixData[10] + matrixData[1] * matrixData[6] * matrixData[8] + matrixData[2] * matrixData[4] * matrixData[9] - matrixData[2] * matrixData[5] * matrixData[8] - matrixData[1] * matrixData[4] * matrixData[10] - matrixData[0] * matrixData[6] * matrixData[9]) / det;

            return inv;
        }
        mat4 transpose() const {
            mat4 result;
            for (int row = 0; row < 4; row++) {
                for (int col = 0; col < 4; col++) {
                    result.matrixData[row * 4 + col] = matrixData[row + 4 * col];
                }
            }
            return result;
        }

        //==============================================
        friend std::ostream& operator<< (std::ostream &out, const mat4& srcMatrix);
        
        bool operator ==(const mat4& srcMatrix) const
        {
            for (int i = 0; i < 16; i++)
                if (std::abs(matrixData[i] - srcMatrix.matrixData[i]) >= std::numeric_limits<float>::epsilon()) {
                    return false;
                }
            return true;
        }
    };
    
    inline std::ostream& operator<< (std::ostream &out, const mat4& srcMatrix)
    {
        for(int i = 0; i < 4; i++)
            out << srcMatrix.matrixData[i] << "\t" << srcMatrix.matrixData[i + 4] << "\t" << srcMatrix.matrixData[i + 8] << "\t" << srcMatrix.matrixData[i + 12] << "\n";
        return out;
    };
}