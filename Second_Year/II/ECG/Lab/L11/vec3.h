#pragma once

#include <cmath>
#include "vec4.h"

namespace egc {

class vec3
{
public:
    union
    {
        float x;
        float r;
        float u;
    };

    union
    {
        float y;
        float g;
        float v;
    };

    union
    {
        float z;
        float b;
        float w;
    };

    //default constructor creates a zero vector
    vec3()
    {
        x = 0.0f;
        y = 0.0f;
        z = 0.0f;
    }

    //creates a vector (fX, fY, fZ)
    vec3(float fX, float fY, float fZ)
    {
        x = fX;
        y = fY;
        z = fZ;
    }

    //copy constructor
    vec3(const vec3 &srcVector)
    {
        x = srcVector.x;
        y = srcVector.y;
        z = srcVector.z;
    }

    vec3(const egc::vec4 &srcVector)
    {
        x = srcVector.x;
        y = srcVector.y;
        z = srcVector.z;
    }

    bool operator ==(const vec3& srcVector) const
    {
        return (std::abs(x - srcVector.x) < std::numeric_limits<float>::epsilon()) && (std::abs(y - srcVector.y) < std::numeric_limits<float>::epsilon()) && (std::abs(z - srcVector.z) < std::numeric_limits<float>::epsilon());
    }

    friend std::ostream& operator<< (std::ostream &out, const vec3& srcVector);

    vec3& operator =(const vec3 &srcVector) {
        x = srcVector.x;
        y = srcVector.y;
        z = srcVector.z;
        return *this;
    }
    vec3 operator +(const vec3& srcVector) const {
        return vec3(x + srcVector.x, y + srcVector.y, z + srcVector.z);
    }
    vec3& operator +=(const vec3& srcVector) {
        x += srcVector.x;
        y += srcVector.y;
        z += srcVector.z;
        return *this;
    }
    vec3 operator *(float scalarValue) const {
        return vec3(x * scalarValue, y * scalarValue, z * scalarValue);
    }
    vec3 operator -(const vec3& srcVector) const {
        return vec3(x - srcVector.x, y - srcVector.y, z - srcVector.z);
    }
    vec3& operator -=(const vec3& srcVector) {
        x -= srcVector.x;
        y -= srcVector.y;
        z -= srcVector.z;
        return *this;
    }
    vec3 operator -() const {
        return vec3(-x, -y, -z);
    }
    float length() const {
        return std::sqrt(x * x + y * y + z * z);
    }
    vec3& normalize() {
        float len = length();
        x /= len;
        y /= len;
        z /= len;
        return *this;
    }
};

inline std::ostream& operator<< (std::ostream &out, const vec3& srcVector)
{
    out << "(" << srcVector.x << ", " << srcVector.y << ", " << srcVector.z << ")";
    return out;
}

inline float dotProduct(const vec3& v1, const vec3& v2) {
    return v1.x * v2.x + v1.y * v2.y + v1.z * v2.z;
}

inline vec3 crossProduct(const vec3& v1, const vec3& v2) {
    return vec3(
        v1.y * v2.z - v1.z * v2.y,
        v1.z * v2.x - v1.x * v2.z,
        v1.x * v2.y - v1.y * v2.x
    );
}

}