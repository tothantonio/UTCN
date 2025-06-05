//
//  projection.cpp
//  Lab8_TODO
//
//  Copyright © 2016 CGIS. All rights reserved.
//

#include "projection.h"

#include "transform.h"

namespace egc {
    //define the viewport transformation matrix
    //see section 3 from the laboratory work
    mat4 defineViewTransformMatrix(int startX, int startY, int width, int height)
    {
		egc::mat4 viewTransformMatrix = mat4();
        viewTransformMatrix.matrixData[0] = width / 2.0f;
        viewTransformMatrix.matrixData[5] = -height / 2.0f;
        viewTransformMatrix.matrixData[12] = (width / 2.0f) + startX;
        viewTransformMatrix.matrixData[13] = (height / 2.0f) + startY;

        return viewTransformMatrix;
    }

    //define the camera transformation matrix
    //see section 4 from the laboratory work
    mat4 defineCameraMatrix(Camera mc)
    {
        mat4 cameraMatrix = mat4();
        egc::vec3 lookAt = mc.cameraTarget - mc.cameraPosition;
        egc::vec3 w = -(lookAt.normalize());
        egc::vec3 u = egc::crossProduct(mc.cameraUp, w);
        u.normalize();
        egc::vec3 v = egc::crossProduct(w, u);

        egc::mat4 m1 = mat4();
        m1.matrixData[0] = u.x;
        m1.matrixData[1] = v.x;
        m1.matrixData[2] = w.x;

        m1.matrixData[4] = u.y;
        m1.matrixData[5] = v.y;
        m1.matrixData[6] = w.y;

        m1.matrixData[8] = u.z;
        m1.matrixData[9] = v.z;
        m1.matrixData[10] = w.z;

        egc::mat4 m2 = egc::translate(-mc.cameraPosition.x, -mc.cameraPosition.y, -mc.cameraPosition.z);

        cameraMatrix = m1 * m2;
        return cameraMatrix;
    }

    //define the projection transformation matrix
    //see section 5 from the laboratory work
    mat4 definePerspectiveProjectionMatrix(float fov, float aspect, float zNear, float zFar)
    {
        mat4 perspectiveProjectionMatrix = mat4();

        // perspectiveProjectionMatrix.matrixData[0] = -1.0f / (aspect * tan(fov / 2));
        // perspectiveProjectionMatrix.matrixData[5] = -1.0f / (tan(fov / 2));
        // perspectiveProjectionMatrix.matrixData[10] = (zFar + zNear) / (zNear - zFar);
        // perspectiveProjectionMatrix.matrixData[14] = (2 * zFar * zNear) / (zFar - zNear);
        // perspectiveProjectionMatrix.matrixData[11] = 1.0f;
        // perspectiveProjectionMatrix.matrixData[15] = 0.0f;

        return perspectiveProjectionMatrix;
    }

    //define the perspective divide operation
    //see section 5 from the laboratory work
    void perspectiveDivide(vec4 &iv)
    {
        iv.x = iv.x / iv.w;
        iv.y = iv.y / iv.w;
        iv.z = iv.z / iv.w;
        iv.w = 1.0f;
    }

    //check if a point should be clipped
    //see section 9 from the laboratory work
    bool clipPointInHomogeneousCoordinate(const egc::vec4 &vertex)
    {
        if ((-abs(vertex.w) <= vertex.x && vertex.x <= abs(vertex.w)) && (-abs(vertex.w) <= vertex.y && vertex.y <= abs(vertex.w)) && (-abs(vertex.w) <= vertex.z && vertex.z <= abs(vertex.w))) {
            return false;
        }
        return true;
    }

    //check if a triangle should be clipped
    //clip only those triangles for which all vertices are outside the viewing volume
    bool clipTriangleInHomegeneousCoordinates(const std::vector<egc::vec4> &triangle)
    {
        return false;
    }

    //compute the normal vector to a triangle
    //see section 7 from the laboratory work
    egc::vec3 findNormalVectorToTriangle(const std::vector<egc::vec4> &triangle)
    {
        egc::vec3 n;
        n = egc::crossProduct(triangle[1] - triangle[0], triangle[2] - triangle[0]);
        return n;
    }

    //compute the coordinates of the triangle's center
    //(we will use this point to display the normal vector)
    egc::vec4 findCenterPointOfTriangle(const std::vector<egc::vec4> &triangle)
    {
        egc::vec4 triangleCenter;
        triangleCenter = triangle[0] + triangle[1] + triangle[2];
        triangleCenter = triangleCenter * (1.0f / 3.0f);
        return triangleCenter;
    }

    //check if the triangle is visible (front facing)
    //see section 8 from the laboratory work
    bool isTriangleVisible(const std::vector<egc::vec4> &triangle, const egc::vec3 &normalVector)
    {
        egc::vec3 centerOfTriangle = findCenterPointOfTriangle(triangle);
        vec3 directionView = egc::vec3(0.0f, 0.0f, 0.0f) - centerOfTriangle;
        if (egc::dotProduct(normalVector, directionView) <= 0) {
            return false;
        }
        return true;
    }

    //display the normal vector of a triangle
    //see section 7 from the laboratory work
    //use the SDL_RenderDrawLine to draw the normal vector
	void displayNormalVectors(egc::vec3 &normalVector, egc::vec4 &triangleCenter, SDL_Renderer *renderer, egc::mat4 viewTransformMatrix, egc::mat4 perspectiveMatrix)
    {
    }
}
