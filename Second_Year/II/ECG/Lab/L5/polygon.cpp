#include "polygon.h"

namespace egc {


    polygon::polygon() {

    }

    void polygon::addVertex(vec3 vertex) {

        this->vertices.push_back(vertex);
    }

    void polygon::clearVertices() {

        this->vertices.clear();
    }

    void polygon::transformVertices()
    {
        this->transformedVertices = this->vertices;
    }

    void polygon::draw(SDL_Renderer *renderer) {

        transformVertices();

        if (this->vertices.size() >= 2) {

            SDL_SetRenderDrawColor(renderer, this->polygonColor.r, this->polygonColor.g, this->polygonColor.b, this->polygonColor.a);
            SDL_RenderLine(
                    renderer,
                    this->transformedVertices.at(0).x,
                    this->transformedVertices.at(0).y,
                    this->transformedVertices.at(1).x,
                    this->transformedVertices.at(1).y);
        }
    }


}