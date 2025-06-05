//  projection.cpp
//  Lab8_TODO
//
//  Copyright © 2016 CGIS. All rights reserved.
//

#include "projection.h"

namespace egc {
    //define the viewport transformation matrix
    //see section 3 from the laboratory work
    mat4 defineViewTransformMatrix(int startX, int startY, int width, int height)
    {
        mat4 viewTransformMatrix;
        mat4 t;
        viewTransformMatrix.at(0, 0) = width / 2.0f;
        viewTransformMatrix.at(0, 1) = 0.0f;
        viewTransformMatrix.at(0, 2) = 0.0f;
        viewTransformMatrix.at(0, 3) = width / 2.0f;

        viewTransformMatrix.at(1, 0) = 0.0f;
        viewTransformMatrix.at(1, 1) = -height / 2.0f;
        viewTransformMatrix.at(1, 2) = 0.0f;
        viewTransformMatrix.at(1, 3) = height / 2.0f;

        viewTransformMatrix.at(2, 0) = 0.0f;
        viewTransformMatrix.at(2, 1) = 0.0f;
        viewTransformMatrix.at(2, 2) = 1.0f;
        viewTransformMatrix.at(2, 3) = 0.0f;

        viewTransformMatrix.at(3, 0) = 0.0f;
        viewTransformMatrix.at(3, 1) = 0.0f;
        viewTransformMatrix.at(3, 2) = 0.0f;
        viewTransformMatrix.at(3, 3) = 1.0f;

        t.at(0, 0) = 1.0f;
        t.at(0, 1) = 0.0f;
        t.at(0, 2) = 0.0f;
        t.at(0, 3) = startX;

        t.at(1, 0) = 0.0f;
        t.at(1, 1) = 1.0f;
        t.at(1, 2) = 0.0f;
        t.at(1, 3) = -startY;

        t.at(2, 0) = 0.0f;
        t.at(2, 1) = 0.0f;
        t.at(2, 2) = 1.0f;
        t.at(2, 3) = 0.0f;

        t.at(3, 0) = 0.0f;
        t.at(3, 1) = 0.0f;
        t.at(3, 2) = 0.0f;
        t.at(3, 3) = 1.0f;


        viewTransformMatrix = t * viewTransformMatrix;


        return viewTransformMatrix;
    }
    float length(vec3 v) {
        return sqrt(v.x * v.x + v.y * v.y + v.z * v.z);
    }

    vec3 normalize(vec3 v) {
        float length = sqrt(v.x * v.x + v.y * v.y + v.z * v.z);
        if (length == 0.0f) return { 0.0f, 0.0f, 0.0f }; // sau un fallback potrivit
        return { v.x / length, v.y / length, v.z / length };
    }
    vec3 cross(vec3 a, vec3 b) {
        return { a.y * b.z - a.z * b.y, a.z * b.x - a.x * b.z, a.x * b.y - a.y * b.x };
    }

    //define the camera transformation matrix
    //see section 4 from the laboratory work
    mat4 defineCameraMatrix(Camera mc)
    {
        mat4 cameraMatrix;
        mat4 t;

        vec3 w = normalize(mc.cameraPosition - mc.cameraTarget);
        vec3 u = normalize(cross(mc.cameraUp, w));
        vec3 v = cross(w, u);


        cameraMatrix.at(0, 0) = u.x;
        cameraMatrix.at(0, 1) = u.y;
        cameraMatrix.at(0, 2) = u.z;
        cameraMatrix.at(0, 3) = 0.0f;
        cameraMatrix.at(1, 0) = v.x;
        cameraMatrix.at(1, 1) = v.y;
        cameraMatrix.at(1, 2) = v.z;
        cameraMatrix.at(1, 3) = 0.0f;
        cameraMatrix.at(2, 0) = w.x;
        cameraMatrix.at(2, 1) = w.y;
        cameraMatrix.at(2, 2) = w.z;
        cameraMatrix.at(2, 3) = 0.0f;
        cameraMatrix.at(3, 0) = 0.0f;
        cameraMatrix.at(3, 1) = 0.0f;
        cameraMatrix.at(3, 2) = 0.0f;
        cameraMatrix.at(3, 3) = 1.0f;

        t.at(0, 0) = 1.0f;
        t.at(0, 1) = 0.0f;
        t.at(0, 2) = 0.0f;
        t.at(0, 3) = -mc.cameraPosition.x;
        t.at(1, 0) = 0.0f;
        t.at(1, 1) = 1.0f;
        t.at(1, 2) = 0.0f;
        t.at(1, 3) = -mc.cameraPosition.y;
        t.at(2, 0) = 0.0f;
        t.at(2, 1) = 0.0f;
        t.at(2, 2) = 1.0f;
        t.at(2, 3) = -mc.cameraPosition.z;
        t.at(3, 0) = 0.0f;
        t.at(3, 1) = 0.0f;
        t.at(3, 2) = 0.0f;
        t.at(3, 3) = 1.0f;
        cameraMatrix = t * cameraMatrix;


        return cameraMatrix;
    }

    //define the projection transformation matrix
    //see section 5 from the laboratory work
    mat4 definePerspectiveProjectionMatrix(float fov, float aspect, float zNear, float zFar)
    {
        mat4 perspectiveProjectionMatrix;

        if (zNear < 0.0f)
            zNear = -zNear;
        if (zFar < 0.0f)
            zFar = -zFar;

        float tanHalfFOV = tan(fov / 2.0f);

        perspectiveProjectionMatrix.at(0, 0) = 1.0f / (aspect * tanHalfFOV);
        perspectiveProjectionMatrix.at(0, 1) = 0.0f;
        perspectiveProjectionMatrix.at(0, 2) = 0.0f;
        perspectiveProjectionMatrix.at(0, 3) = 0.0f;

        perspectiveProjectionMatrix.at(1, 0) = 0.0f;
        perspectiveProjectionMatrix.at(1, 1) = 1.0f / tanHalfFOV;
        perspectiveProjectionMatrix.at(1, 2) = 0.0f;
        perspectiveProjectionMatrix.at(1, 3) = 0.0f;

        perspectiveProjectionMatrix.at(2, 0) = 0.0f;
        perspectiveProjectionMatrix.at(2, 1) = 0.0f;
        perspectiveProjectionMatrix.at(2, 2) = -(zFar + zNear) / (zFar - zNear);
        perspectiveProjectionMatrix.at(2, 3) = -(2.0f * zFar * zNear) / (zFar - zNear);

        perspectiveProjectionMatrix.at(3, 0) = 0.0f;
        perspectiveProjectionMatrix.at(3, 1) = 0.0f;
        perspectiveProjectionMatrix.at(3, 2) = -1.0f;
        perspectiveProjectionMatrix.at(3, 3) = 0.0f;

        return perspectiveProjectionMatrix;
    }



    //define the perspective divide operation
    //see section 5 from the laboratory work
    void perspectiveDivide(vec4& iv)
    {
        if (iv.w != 0.0f)
        {
            iv.x /= iv.w;
            iv.y /= iv.w;
            iv.z /= iv.w;
            iv.w = 1.0f;
        }
        else
        {
            iv.x = 0.0f;
            iv.y = 0.0f;
            iv.z = 0.0f;
            iv.w = 1.0f;
        }

    }

    //check if a point should be clipped
    //see section 9 from the laboratory work
    bool clipPointInHomogeneousCoordinate(const egc::vec4& vertex)
    {
        //check if the vertex is outside the viewing volume
        if (vertex.x < -vertex.w || vertex.x > vertex.w ||
            vertex.y < -vertex.w || vertex.y > vertex.w ||
            vertex.z < -vertex.w || vertex.z > vertex.w)
        {

            return true;
        }

        return false;
    }

    //check if a triangle should be clipped
    //clip only those triangles for which all vertices are outside the viewing volume
    //!!!!!!
    bool clipTriangleInHomegeneousCoordinates(const std::vector<egc::vec4>& triangle)
    {
        if (triangle.size() != 3)
        {
            return false;
        }
        //check if the triangle is outside the viewing volume
        if (clipPointInHomogeneousCoordinate(triangle[0]) &&
            clipPointInHomogeneousCoordinate(triangle[1]) &&
            clipPointInHomogeneousCoordinate(triangle[2]))
        {
            return true;
        }

        return false;
    }

    //compute the normal vector to a triangle
    //see section 7 from the laboratory work
    egc::vec3 findNormalVectorToTriangle(const std::vector<egc::vec4>& triangle)
    {
        egc::vec3 n;

        egc::vec3 v1 = { triangle.at(0).x, triangle.at(0).y, triangle.at(0).z };
        egc::vec3 v2 = { triangle.at(1).x, triangle.at(1).y, triangle.at(1).z };
        egc::vec3 v3 = { triangle.at(2).x, triangle.at(2).y, triangle.at(2).z };
        egc::vec3 v1v2 = { v2.x - v1.x, v2.y - v1.y, v2.z - v1.z };
        egc::vec3 v1v3 = { v3.x - v1.x, v3.y - v1.y, v3.z - v1.z };
        n = cross(v1v2, v1v3);
        n = normalize(n);
        //n.x = n.x / length(n);
        //n.y = n.y / length(n);


        return n;
    }

    //compute the coordinates of the triangle's center
    //(we will use this point to display the normal vector)
    egc::vec4 findCenterPointOfTriangle(const std::vector<egc::vec4>& triangle)
    {
        egc::vec4 triangleCenter;
        triangleCenter.x = (triangle.at(0).x + triangle.at(1).x + triangle.at(2).x) / 3.0f;
        triangleCenter.y = (triangle.at(0).y + triangle.at(1).y + triangle.at(2).y) / 3.0f;
        triangleCenter.z = (triangle.at(0).z + triangle.at(1).z + triangle.at(2).z) / 3.0f;
        triangleCenter.w = 1.0f;

        return triangleCenter;
    }

    //check if the triangle is visible (front facing)
    //see section 8 from the laboratory work
    bool isTriangleVisible(const std::vector<egc::vec4>& triangle, const egc::vec3& normalVector)
    {
        egc::vec3 cameraPosition = { 0.0f, 0.0f, 0.0f };
        egc::vec3 triangleCenter = { triangle.at(0).x, triangle.at(0).y, triangle.at(0).z };
        egc::vec3 triangleToCamera = { cameraPosition.x - triangleCenter.x, cameraPosition.y - triangleCenter.y, cameraPosition.z - triangleCenter.z };
        triangleToCamera = normalize(triangleToCamera);
        //check if the triangle is front facing
        if (normalVector.x * triangleToCamera.x + normalVector.y * triangleToCamera.y + normalVector.z * triangleToCamera.z < 0.0f)
        {
            return false;
        }
        //check if the triangle is back facing
        return true;
    }

    //display the normal vector of a triangle
    //see section 7 from the laboratory work
    //use the SDL_RenderDrawLine to draw the normal vector
    void displayNormalVectors(egc::vec3& normalVector, egc::vec4& triangleCenter, SDL_Renderer* renderer, egc::mat4 viewTransformMatrix, egc::mat4 perspectiveMatrix)
    {
        egc::vec4 normalEndpoint = triangleCenter + egc::vec4(normalVector.x * 0.1f, normalVector.y * 0.1f, normalVector.z * 0.1f, 0.0f);

        egc::vec4 transformedCenter = perspectiveMatrix * triangleCenter;
        egc::vec4 transformedNormalEndpoint = perspectiveMatrix * viewTransformMatrix * normalEndpoint;

        perspectiveDivide(transformedCenter);
        perspectiveDivide(transformedNormalEndpoint);

        // Convert to screen space (viewport transform)
        transformedCenter = viewTransformMatrix * transformedCenter;
        transformedNormalEndpoint = viewTransformMatrix * transformedNormalEndpoint;

        // Draw line using SDL_RenderDrawLine
        SDL_RenderLine(renderer,
            (int)transformedCenter.x, (int)transformedCenter.y,
            (int)transformedNormalEndpoint.x, (int)transformedNormalEndpoint.y);

    }
}