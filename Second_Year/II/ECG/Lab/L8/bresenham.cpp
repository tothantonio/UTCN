#include "bresenham.h"
#include <SDL3/SDL.h>

#include <iostream>
//Detects in which octant a line is situated

int getOctant(BresenhamLine line) {

	int deltaX = (line.endX - line.startX);
	int deltaY = (line.endY - line.startY);

	float m = abs(deltaY) / (float)abs(deltaX);

	if ((m < 1) && (deltaX > 0) && (deltaY < 0)) //first octant
		return 1;
	if ((m > 1) && (deltaX > 0) && (deltaY < 0))  //second octant
		return 2;
	if ((m > 1) && (deltaX < 0) && (deltaY < 0))  //third octant
		return 3;
	if ((m < 1) && (deltaX < 0) && (deltaY < 0)) //forth octant
		return 4;
	if ((m < 1) && (deltaX < 0) && (deltaY > 0)) //fifth octant
		return 5;
	if ((m > 1) && (deltaX < 0) && (deltaY > 0)) // sixth octant
		return 6;
	if ((m > 1) && (deltaX > 0) && (deltaY > 0)) // seventh octant
		return 7;
	if ((m < 1) && (deltaX > 0) && (deltaY > 0)) // eight octant
		return 8;

	return 0;
}

//Draws a new raster line using Bresenham's algorithm
void BresenhamDraw(BresenhamLine line, SDL_Renderer* renderer) {
	int startX = 0;
	int startY = 0;
	int endX = 0;
	int endY = 0;
	int currentX = 0;
	int currentY = 0;

	int dy = abs(line.endY - line.startY);
	int dx = abs(line.endX - line.startX);

	int d, inc1, inc2;

	switch (int octant = getOctant(line))
	{
	case 1: // pt octantul 1

		startX = currentX = line.startX;
		endX = line.endX;
		startY = currentY = line.startY;
		endY = line.endY;

		d = 2 * dy - dx;
		inc1 = 2 * dy;
		inc2 = 2 * (dy - dx);

		while (currentX < endX)
		{
			//Draw current point
			SDL_SetRenderDrawColor(renderer, 0xFF, 0x00, 0x00, 0x00);
			SDL_RenderPoint(renderer, currentX, currentY);
			currentX++;

			if (d < 0) {
				d += inc1;
			}else{
				d += inc2;
				--currentY;
			}
		}
		break;
	case 2:

		startX = currentX = line.startX;
		endX = line.endX;
		startY = currentY = line.startY;
		endY = line.endY;

		d = 2 * dx - dy;
		inc1 = 2 * dx;
		inc2 = 2 * (dx - dy);

		while (currentY > endY) {
			SDL_SetRenderDrawColor(renderer, 255, 165, 0, 255);
			SDL_RenderPoint(renderer, currentX, currentY);
			currentY--;

			if (d < 0)
				d += inc1;
			else {
				d += inc2;
				++currentX;
			}
		}
		break;
	case 3:

		startX = currentX = line.startX;
		endX = line.endX;
		startY = currentY = line.startY;
		endY = line.endY;

		d = 2 * dx - dy;
		inc1 = 2 * dx;
		inc2 = 2 * (dx - dy);

		while (currentY > endY) {
			SDL_SetRenderDrawColor(renderer, 255, 255, 0, 255);
			SDL_RenderPoint(renderer, currentX, currentY);
			currentY--;

			if (d < 0)
				d += inc1;
			else {
				d += inc2;
				--currentX;
			}
		}
		break;
	case 4:
		startX = currentX = line.startX;
		endX = line.endX;
		startY = currentY = line.startY;
		endY = line.endY;

		d = 2 * dy - dx;
		inc1 = 2 * dy;
		inc2 = 2 * (dy - dx);

		while (currentX > endX)
		{
			//Draw current point
			SDL_SetRenderDrawColor(renderer, 0, 128, 0, 255);
			SDL_RenderPoint(renderer, currentX, currentY);
			--currentX;

			if (d < 0)
				d += inc1;
			else
			{
				d += inc2;
				--currentY;
			}
		}
		break;
	case 5:
		startX = currentX = line.startX;
		endX = line.endX;
		startY = currentY = line.startY;
		endY = line.endY;

		d = 2 * dy - dx;
		inc1 = 2 * dy;
		inc2 = 2 * (dy - dx);

		while (currentX > endX)
		{
			//Draw current point
			SDL_SetRenderDrawColor(renderer, 0, 0, 255, 255);
			SDL_RenderPoint(renderer, currentX, currentY);
			--currentX;

			if (d < 0)
				d += inc1;
			else
			{
				d += inc2;
				++currentY;
			}
		}
		break;
	case 6:
		startX = currentX = line.startX;
		endX = line.endX;
		startY = currentY = line.startY;
		endY = line.endY;

		d = 2 * dx - dy;
		inc1 = 2 * dx;
		inc2 = 2 * (dx - dy);

		while (currentY < endY) {
			SDL_SetRenderDrawColor(renderer, 75, 0, 130, 255);
			SDL_RenderPoint(renderer, currentX, currentY);
			++currentY;

			if (d < 0)
				d += inc1;
			else {
				d += inc2;
				--currentX;
			}
		}
		break;
	case 7:
		startX = currentX = line.startX;
		endX = line.endX;
		startY = currentY = line.startY;
		endY = line.endY;

		d = 2 * dx - dy;
		inc1 = 2 * dx;
		inc2 = 2 * (dx - dy);

		while (currentY < endY) {
			SDL_SetRenderDrawColor(renderer, 148, 0, 211, 255);
			SDL_RenderPoint(renderer, currentX, currentY);
			++currentY;

			if (d < 0)
				d += inc1;
			else {
				d += inc2;
				++currentX;
			}
		}
		break;
	case 8:
		startX = currentX = line.startX;
		endX = line.endX;
		startY = currentY = line.startY;
		endY = line.endY;

		d = 2 * dy - dx;
		inc1 = 2 * dy;
		inc2 = 2 * (dy - dx);

		while (currentX < endX)
		{
			//Draw current point
			SDL_SetRenderDrawColor(renderer, 255, 105, 180, 255);
			SDL_RenderPoint(renderer, currentX, currentY);
			++currentX;

			if (d < 0)
				d += inc1;
			else
			{
				d += inc2;
				++currentY;
			}
		}
		break;

	default:
		break;
	}
}


void plot_points(SDL_Renderer* renderer, int x, int y, int x0, int y0) {
	SDL_RenderPoint(renderer, x0 + x, y0 + y);
	SDL_RenderPoint(renderer, x0 - x, y0 + y);
	SDL_RenderPoint(renderer, x0 + x, y0 - y);
	SDL_RenderPoint(renderer, x0 - x, y0 - y);
	SDL_RenderPoint(renderer, x0 + y, y0 + x);
	SDL_RenderPoint(renderer, x0 - y, y0 + x);
	SDL_RenderPoint(renderer, x0 + y, y0 - x);
	SDL_RenderPoint(renderer, x0 - y, y0 - x);
}

void BresenhamDraw(BresenhamCircle circle, SDL_Renderer* renderer) {
	int x = 0;
	int y = circle.radius;
	int d = 1 / 4 - circle.radius;

	while (x < (circle.radius / std::sqrt(2))) {
		plot_points(renderer, x, y, circle.centerX, circle.centerY);
		x++;
		d = d + 2 * x + 1;
		if (d > 0) {
			--y;
			d = d + 2 - 2 * y;
		}
	}
}
