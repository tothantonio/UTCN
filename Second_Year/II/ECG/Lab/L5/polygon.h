#pragma once

#include <vector>
#include <SDL3/SDL.h>
#include "vec3.h"
#include "mat3.h"

namespace egc {

    class polygon {
    public:
        std::vector<vec3> vertices;
        std::vector<vec3> transformedVertices;
        mat3 transformationMatrix;
        SDL_Color polygonColor { 0, 0, 255, 255 };

        polygon();
        void addVertex(vec3 vertex);
        void clearVertices();
        void transformVertices();
        void draw(SDL_Renderer *renderer);
    };
}
