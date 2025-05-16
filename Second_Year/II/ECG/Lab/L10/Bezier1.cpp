#include "Bezier.h"

//Return the value of P(t), where t is in [0,1]
vec2 getParametricPoint(float t, vec2 p0, vec2 p1) {
	//P(t) = (1 - t)*P0 + t*P1
	vec2 point;
	point.x = (1.f - t) * p0.x + t * p1.x;
	point.y = (1.f - t) * p0.y + t * p1.y;
	return point;
}

//Paint the pixels that are on the line P0P1
void drawParametricLinePoints(vec2 p0, vec2 p1, SDL_Renderer* renderer) {
	//Hint: To paint a single pixel, you can use the function: SDL_RenderDrawPoint(renderer, x, y)
	int steps = 10000;
	for (int i = 0; i <= steps; ++i) {
		float t = (float)i / steps;
		vec2 point = getParametricPoint(t, p0, p1);
		SDL_RenderPoint(renderer, point.x, point.y);
	}
}

//Return the value of B(t), where t is in [0,1]. The value of B(t) is computed by taking into account all the 
//controll points contained within the input vecto
vec2 getBezierPoint(std::vector<vec2> controlPoints, float t) {
	//Bn(t) = (1-t)*Bn-1(t) + t * Bn(t)
	if (controlPoints.size() == 1) {
		return controlPoints[0];
	}
	std::vector<vec2> nextPoints;
		for (int i = 0; i < controlPoints.size() - 1; ++i) {
			vec2 p;
			p.x = (1 - t) * controlPoints[i].x + t * controlPoints[i + 1].x;
			p.y = (1 - t) * controlPoints[i].y + t * controlPoints[i + 1].y;
			nextPoints.push_back(p);
		}

	return getBezierPoint(nextPoints, t);
}

//Paint the pixels that are on the Bezier curve defined by the given control points
void drawBezierPoints(std::vector<vec2> controlPoints, SDL_Renderer* renderer) {
	int steps = 10000;
	for (int i = 0; i <= steps; ++i) {
		float t = (float)i / steps;
		vec2 point = getBezierPoint(controlPoints, t);
		SDL_RenderPoint(renderer, point.x, point.y);
	}
}
