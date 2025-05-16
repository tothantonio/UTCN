#include "rasterization.h"

namespace egc {
	void computeAlphaBetaGamma(const std::vector<egc::vec4>& triangleVertices, vec2 pixel, float& alpha, float& beta, float& gamma)
	{
		//TO DO - Compute alfa, beta and gamma => we use the function's input parameters as the return mechanism
		//Store the final results in the input parameters
		vec2 v0(triangleVertices[0].x, triangleVertices[0].y);
		vec2 v1(triangleVertices[1].x, triangleVertices[1].y);
		vec2 v2(triangleVertices[2].x, triangleVertices[2].y);

		alpha = ((v1.y - v2.y) * (pixel.x - v2.x) + (v2.x - v1.x) * (pixel.y - v2.y)) / ((v1.y - v2.y) * (v0.x - v2.x) + (v2.x - v1.x) * (v0.y - v2.y));
		beta = ((v2.y - v0.y) * (pixel.x - v2.x) + (v0.x - v2.x) * (pixel.y - v2.y)) / ((v1.y - v2.y) * (v0.x - v2.x) + (v2.x - v1.x) * (v0.y - v2.y));
		gamma = 1.0f - alpha - beta;
	}

	void rasterizeTriangle(SDL_Renderer *renderer, const std::vector<egc::vec4> &triangleVertices, const std::vector<egc::vec4> &triangleColors) {
		// Extract triangle vertices
		vec2 v0(triangleVertices[0].x, triangleVertices[0].y);
		vec2 v1(triangleVertices[1].x, triangleVertices[1].y);
		vec2 v2(triangleVertices[2].x, triangleVertices[2].y);

		// Compute the bounding box of the triangle
		int minX = std::min(std::min(v0.x, v1.x), v2.x);
		int maxX = std::max(std::max(v0.x, v1.x), v2.x);
		int minY = std::min(std::min(v0.y, v1.y), v2.y);
		int maxY = std::max(std::max(v0.y, v1.y), v2.y);

		// Iterate over each pixel in the bounding box
		for (int y = minY; y <= maxY; y++) {
			for (int x = minX; x <= maxX; x++) {
				vec2 pixel(x, y);
				float alpha, beta, gamma;

				computeAlphaBetaGamma(triangleVertices, pixel, alpha, beta, gamma);

				if (alpha >= 0 && beta >= 0 && gamma >= 0) {
					float r = alpha * triangleColors[0].x + beta * triangleColors[1].x + gamma * triangleColors[2].x;
					float g = alpha * triangleColors[0].y + beta * triangleColors[1].y + gamma * triangleColors[2].y;
					float b = alpha * triangleColors[0].z + beta * triangleColors[1].z + gamma * triangleColors[2].z;

					SDL_SetRenderDrawColor(renderer, static_cast<Uint8>(r), static_cast<Uint8>(g), static_cast<Uint8>(b), 255);
					SDL_RenderPoint(renderer, x, y);
				}
			}
		}
	}
}