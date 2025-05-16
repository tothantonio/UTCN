//
//  mat3.h
//  Lab3_TODO
//
//  Copyright © 2016 CGIS. All rights reserved.
//

#pragma once

#include <algorithm>
#include <iostream>
#include "vec3.h"

namespace egc {
    class mat3
    {
    public:
        //==============================================
        //matrixData is stored in column-major order
        //  m0  m3   m6
        //  m1  m4   m7
        //  m2  m5   m8
        //
        //  matrixData[] = {m0, m1, m2,
        //                  m3, m4, m5,
        //                  m6, m7, m8}
        //==============================================
        float matrixData[9];
        
        //==============================================
        //constructors
        //==============================================
        
        //default constructor creates an identity matrix
        mat3()
        {
            for (int i = 0; i < 9; i++) {
                matrixData[i] = (i % 4) ? 0.0f : 1.0f;
            }
        }
        
        mat3(const float* srcMatrix)
        {
            std::copy(srcMatrix, srcMatrix + 9, matrixData);
        }
        
        //==============================================
        // TO BE IMPLEMENTED
        //==============================================
        mat3& operator =(const mat3& srcMatrix) {
            for (int i = 0; i < 9; i++) {
                matrixData[i] = srcMatrix.matrixData[i];
            }
            return *this;
        }
        mat3 operator *(float scalarValue) const {
            mat3 res;
            for (int i = 0; i < 9; i++) {
                res.matrixData[i] = matrixData[i] * scalarValue;
            }
            return res;
        }
        mat3 operator *(const mat3& srcMatrix) const {
            mat3 res;
            for (int i = 0; i < 3; i++) {
                for (int j = 0; j < 3; j++) {
                    res.at(i, j) = 0;
                    for (int k = 0; k < 3; k++) {
                        res.at(i, j) += at(i, k) * srcMatrix.at(k, j);
                    }
                }
            }
            return res;
        }
        vec3 operator *(const vec3& srcVector) const {
            return vec3(
                at(0, 0) * srcVector.x + at(0, 1) * srcVector.y + at(0, 2) * srcVector.z,
                at(1, 0) * srcVector.x + at(1, 1) * srcVector.y + at(1, 2) * srcVector.z,
                at(2, 0) * srcVector.x + at(2, 1) * srcVector.y + at(2, 2) * srcVector.z
                );
        }
        mat3 operator +(const mat3& srcMatrix) const {
            mat3 res;
            for (int i = 0; i < 9; i++) {
                res.matrixData[i] = matrixData[i] + srcMatrix.matrixData[i];
            }
            return res;
        }
        //get element by (row, column)
        float& at(int i, int j) {
            return matrixData[i + j * 3];
        }
        const float& at(int i, int j) const {
            return matrixData[i + j * 3];
        }
        float determinant() const {
            return at(0,0)*(at(1,1)*at(2,2) - at(1,2)*at(2,1)) -
                   at(0,1)*(at(1,0)*at(2,2) - at(1,2)*at(2,0)) +
                   at(0,2)*(at(1,0)*at(2,1) - at(1,1)*at(2,0));
        }
        mat3 inverse() const {
            mat3 inv;
            float det = determinant();
            float invDet = 1.0f / det;
            inv.at(0, 0) = (at(1, 1) * at(2, 2) - at(1, 2) * at(2, 1)) * invDet;
            inv.at(0, 1) = (at(0, 2) * at(2, 1) - at(0, 1) * at(2, 2)) * invDet;
            inv.at(0, 2) = (at(0, 1) * at(1, 2) - at(0, 2) * at(1, 1)) * invDet;
            inv.at(1, 0) = (at(1, 2) * at(2, 0) - at(1, 0) * at(2, 2)) * invDet;
            inv.at(1, 1) = (at(0, 0) * at(2, 2) - at(0, 2) * at(2, 0)) * invDet;
            inv.at(1, 2) = (at(0, 2) * at(1, 0) - at(0, 0) * at(1, 2)) * invDet;
            inv.at(2, 0) = (at(1, 0) * at(2, 1) - at(1, 1) * at(2, 0)) * invDet;
            inv.at(2, 1) = (at(0, 1) * at(2, 0) - at(0, 0) * at(2, 1)) * invDet;
            inv.at(2, 2) = (at(0, 0) * at(1, 1) - at(0, 1) * at(1, 0)) * invDet;
            return inv;
        }
        mat3 transpose() const {
            mat3 res;
            for (int i = 0; i < 3; i++) {
                for (int j = 0; j < 3; j++) {
                    res.matrixData[i + j * 3] = matrixData[j + i * 3];
                }
            }
            return res;
        }
        
        //==============================================
        friend std::ostream& operator<< (std::ostream &out, const mat3& srcMatrix);
        
        bool operator ==(const mat3& srcMatrix) const
        {
            for (int i = 0; i < 9; i++)
                if (std::abs(matrixData[i] - srcMatrix.matrixData[i]) >= std::numeric_limits<float>::epsilon()) {
                    return false;
                }
            return true;
        }
    };
    
    inline std::ostream& operator<< (std::ostream &out, const mat3& srcMatrix)
    {
        for(int i = 0; i < 3; i++)
            out << srcMatrix.matrixData[i] << "\t" << srcMatrix.matrixData[i + 3] << "\t" << srcMatrix.matrixData[i + 6] << "\n";
        return out;
    };
}