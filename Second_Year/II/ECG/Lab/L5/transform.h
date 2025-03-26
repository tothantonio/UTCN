//
//  transformations.hpp
//  Lab4_TODO
//
//  Copyright © 2016 CGIS. All rights reserved.
//

#pragma once

#include "vec2.h"
#include "vec3.h"
#include "mat3.h"
#include "mat4.h"

namespace egc {
    const double PI = atan(1.0) * 4;

    //transformation matrices in 2D
    mat3 translate(const vec2 translateArray){
        mat3 translationMatrix = mat3();
        translationMatrix.at(0, 2) = translateArray.x;
        translationMatrix.at(1, 2) = translateArray.y;
        return translationMatrix;
    }

     mat3 translate(float tx, float ty){
        mat3 translationMatrix = mat3();
        translationMatrix.at(0, 2) = tx;
        translationMatrix.at(1, 2) = ty;
        return translationMatrix;
    }

    mat3 scale(const vec2 scaleArray) {
        mat3 matrix = mat3();
        matrix.at(0, 0) = scaleArray.x;
        matrix.at(1, 1) = scaleArray.y;
        return matrix;
    }
    mat3 scale(float sx, float sy) {
        mat3 matrix = mat3();
        matrix.at(0,0) = sx;
        matrix.at(1,1) = sy;
        return matrix;
    }

    mat3 rotate(float angle) {
        mat3 matrix = mat3();
        float radian = (PI * angle) / 180.f;
        matrix.at(0, 0) = cos(radian);
        matrix.at(0, 1) = -sin(radian);
        matrix.at(1, 0) = sin(radian);
        matrix.at(1, 1) = cos(radian);
        return matrix;
    }

    //transformation matrices in 3D
    mat4 translate(const vec3 translateArray) {
        mat4 translationMatrix = mat4();
        translationMatrix.at(0, 3) = translateArray.x;
        translationMatrix.at(1, 3) = translateArray.y;
        translationMatrix.at(2, 3) = translateArray.z;
        return translationMatrix;
    }
    mat4 translate(float tx, float ty, float tz) {
        mat4 translationMatrix = mat4();
        translationMatrix.at(0, 3) = tx;
        translationMatrix.at(1, 3) = ty;
        translationMatrix.at(2, 3) = tz;
        return translationMatrix;
    }

    mat4 scale(const vec3 scaleArray) {
        mat4 matrix = mat4();
        matrix.at(0, 0) = scaleArray.x;
        matrix.at(1, 1) = scaleArray.y;
        matrix.at(2, 2) = scaleArray.z;
        return matrix;
    }
    mat4 scale(float sx, float sy, float sz) {
        mat4 matrix = mat4();
        matrix.at(0, 0) = sx;
        matrix.at(1, 1) = sy;
        matrix.at(2, 2) = sz;
        return matrix;
    }

    mat4 rotateX(float angle) {
        float radian = (PI * angle) / 180.f;
        mat4 matrix = mat4();
        matrix.at(1, 1) = cos(radian);
        matrix.at(1, 2) = -sin(radian);
        matrix.at(2, 1) = sin(radian);
        matrix.at(2, 2) = cos(radian);
        return matrix;
    }
    mat4 rotateY(float angle) {
        float radian = (PI * angle) / 180.f;
        mat4 matrix = mat4();
        matrix.at(0, 0) = cos(radian);
        matrix.at(0, 2) = sin(radian);
        matrix.at(2, 0) = -sin(radian);
        matrix.at(2, 2) = cos(radian);
        return matrix;
    }
    mat4 rotateZ(float angle) {
        float radian = (PI * angle) / 180.f;
        mat4 matrix = mat4();
        matrix.at(0, 0) = cos(radian);
        matrix.at(0, 1) = -sin(radian);
        matrix.at(1, 0) = sin(radian);
        matrix.at(1, 1) = cos(radian);
        return matrix;
    }
}