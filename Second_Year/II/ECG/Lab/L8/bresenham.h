#include <SDL3/SDL.h>
#include "math.h"

typedef struct _Bline
{
	float startX;
	float startY;
	float endX;
	float endY;
} BresenhamLine;

typedef struct _Bcircle
{
	float centerX;
	float centerY;
	float radius;
} BresenhamCircle;

//Detects in which octant a line is situated
int getOctant(BresenhamLine line);

//Draws a new raster line using Bresenham's algorithm
void BresenhamDraw(BresenhamLine line, SDL_Renderer* renderer);

//Draws a new raster circle using Bresenham's algorithm
void BresenhamDraw(BresenhamCircle circle, SDL_Renderer* renderer);