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
        this->transformedVertices.clear();

        long verticesSize = this->vertices.size();

        for (int i = 0; i < verticesSize; i++) {
            this->transformedVertices.push_back(transformationMatrix * this->vertices[i]);
        }
    }

    void polygon::draw(SDL_Renderer *renderer)
    {

        transformVertices();
        long verticesSize = this->vertices.size();
        if (this->vertices.size() >= 2) {
            SDL_SetRenderDrawColor(renderer, this->polygonColor.r, this->polygonColor.g, this->polygonColor.b, this->polygonColor.a);
            SDL_RenderLine(
                    renderer,
                    this->transformedVertices.at(0).x,
                    this->transformedVertices.at(0).y,
                    this->transformedVertices.at(1).x,
                    this->transformedVertices.at(1).y);
            SDL_RenderLine(
                renderer,
                this->transformedVertices.at(1).x,
                this->transformedVertices.at(1).y,
                this->transformedVertices.at(2).x,
                this->transformedVertices.at(2).y);
            SDL_RenderLine(
                renderer,
                this->transformedVertices.at(2).x,
                this->transformedVertices.at(2).y,
                this->transformedVertices.at(3).x,
                this->transformedVertices.at(3).y);

            SDL_RenderLine(
                renderer,
                this->transformedVertices.at(0).x,
                this->transformedVertices.at(0).y,
                this->transformedVertices.at(3).x,
                this->transformedVertices.at(3).y);
            // SDL_RenderLine(
            //     renderer,
            //     this->transformedVertices.at(verticesSize - 1).x,
            //     this->transformedVertices.at(verticesSize - 1).y,
            //     this->transformedVertices.at(0).x,
            //     this->transformedVertices.at(0).y);
        }

    }
}