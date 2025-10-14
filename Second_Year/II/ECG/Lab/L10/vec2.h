//
//  vec2.h
//  Lab2
//
//  Copyright © 2016 CGIS. All rights reserved.
//

#pragma once

#include <cmath>
#include <iostream>
#include "vec3.h"
#include "vec4.h"

namespace egc {

class vec2
{
public:
    union
    {
        float x;
        float u;
    };

    union
    {
        float y;
        float v;
    };

    //=========================================
    //constructors
    //=========================================

    //default constructor creates a zero vector
    vec2()
    {
		x = 0.0f;
		y = 0.0f;
    }

    //creates a vector (fX, fY)
    vec2(float fX, float fY)
    {
		x = fX;
		y = fY;
    }

    //copy constructor
    vec2(const vec2 &srcVector)
    {
		x = srcVector.x;
		y = srcVector.y;
    }

    vec2(const egc::vec3 &srcVector)
    {
		x = srcVector.x;
		y = srcVector.y;
    }

    vec2(const egc::vec4 &srcVector)
    {
		x = srcVector.x;
		y = srcVector.y;
    }

    //=========================================
    //
    //=========================================

    bool operator ==(const vec2& srcVector) const
    {
        return (std::abs(x - srcVector.x) < std::numeric_limits<float>::epsilon()) && (std::abs(y - srcVector.y) < std::numeric_limits<float>::epsilon());
    }

    friend std::ostream& operator<< (std::ostream &out, const vec2& srcVector);

    //=========================================
    //2D vector operations
    //TO BE IMPLEMENTED
    //=========================================

    vec2& operator =(const vec2 &srcVector) {
        x = srcVector.x;
        y = srcVector.y;
        return *this;
    }
    vec2 operator +(const vec2& srcVector) const {
        return vec2(x + srcVector.x, y + srcVector.y);
    }
    vec2& operator +=(const vec2& srcVector) {
        x += srcVector.x;
        y += srcVector.y;
        return *this;
    }
    vec2 operator *(float scalarValue) const {
        return vec2(x * scalarValue, y * scalarValue);
    }
    vec2 operator -(const vec2& srcVector) {
        return vec2(x - srcVector.x, y - srcVector.y);
    }
    vec2& operator -=(const vec2& srcVector) {
        x -= srcVector.x;
        y -= srcVector.y;
        return *this;
    }
    vec2 operator -() const {
        return vec2(-x, -y);
    }
    float length() const {
        return std::sqrt(x * x + y * y);
    }
    vec2& normalize() {
        float len = length();
        x /= len;
        y /= len;
        return *this;
    }
};

    inline std::ostream& operator<< (std::ostream &out, const vec2& srcVector)
    {
        out << "(" << srcVector.x << ", " << srcVector.y << ")";
        return out;
    };


    inline float dotProduct(const vec2& v1, const vec2& v2) {
        return v1.x * v2.x + v1.y * v2.y;
    }
}
