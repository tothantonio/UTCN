//
//  GPSLab1.cpp
//
//  Copyright © 2017 CGIS. All rights reserved.
//

#include "GPSLab1.hpp"

namespace gps {
    glm::vec4 TransformPoint(const glm::vec4 &point)
    {
        return glm::vec4(1.0f);
    }
    
    float ComputeAngle(const glm::vec3 &v1, const glm::vec3 &v2)
    {
        return glm::degrees(acos(glm::dot(glm::normalize(v1), glm::normalize(v2))));
    }
    
    bool IsConvex(const std::vector<glm::vec2> &vertices)
    {
        return true;
    }
    
    std::vector<glm::vec2> ComputeNormals(const std::vector<glm::vec2> &vertices)
    {
        std::vector<glm::vec2> normalsList;
        return normalsList;
    }
}
