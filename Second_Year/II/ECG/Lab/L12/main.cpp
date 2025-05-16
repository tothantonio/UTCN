// SDL_TriangleRender.cpp : Defines the entry point for the console application.
//

#include <iostream>
#include <SDL3/SDL.h>
#include "rasterization.h"
#include "Validator.h"

using namespace egc;

//define window dimensions
constexpr int WINDOW_WIDTH { 800 };
constexpr int WINDOW_HEIGHT { 600 };

SDL_Window* window { nullptr };
SDL_Renderer* renderer { nullptr };
SDL_Event currentEvent;

SDL_Color backgroundColor{ 255, 255, 255, 255 };

bool quit { false };

float mouseX { -1.0f }, mouseY { -1.0f };

float displayScale{ 1.0f };

bool initWindow()
{
	bool success { true };

	//Try to initialize SDL
	if (!SDL_Init(SDL_INIT_VIDEO))
	{
		SDL_Log("SDL initialization failed: %s\n", SDL_GetError());
		success = false;
	}
	else {
		//Try to create the window and renderer
		displayScale = SDL_GetDisplayContentScale(1);

		if (!SDL_CreateWindowAndRenderer(
			"SDL Hello World Example",
			static_cast<int>(displayScale * WINDOW_WIDTH),
			static_cast<int>(displayScale * WINDOW_HEIGHT),
			SDL_WINDOW_HIGH_PIXEL_DENSITY,
			&window, &renderer))
		{
			SDL_Log("Failed to create window and renderer: %s\n", SDL_GetError());
			success = false;
		}
		else
		{
			//Apply global display scaling to renderer
			SDL_SetRenderScale(renderer, displayScale, displayScale);

			//Set background color
			SDL_SetRenderDrawColor(renderer, backgroundColor.r, backgroundColor.g, backgroundColor.b, backgroundColor.a);

			//Apply background color
			SDL_RenderClear(renderer);
		}
	}

	return success;
}

void destroyWindow()
{
	//Destroy renderer
	if (renderer)
		SDL_DestroyRenderer(renderer);
	renderer = nullptr;

	//Destroy window
	if (window)
		SDL_DestroyWindow(window);
	window = nullptr;

	//Quit SDL
	SDL_Quit();
}

int main(int argc, char * argv[]) {

	if (!initWindow())
	{
		SDL_Log("Failed to initialize");
		return -1;
	}

	//Define the triangle as a vector of vertices (vec4)
	std::vector<egc::vec4> triangle;
	triangle.push_back(egc::vec4(300.0f, 100.0f, 0.0f, 1.0f));
	triangle.push_back(egc::vec4(600.0f, 400.0f, 0.0f, 1.0f));
	triangle.push_back(egc::vec4(100.0f, 400.0f, 0.0f, 1.0f));

	//Define colors for each of the triangle vertices
	std::vector<egc::vec4> triangleColors;
	triangleColors.push_back(egc::vec4(255.0f, 0.0f, 0.0f, 255.0f));
	triangleColors.push_back(egc::vec4(0.0f, 255.0f, 0.0f, 255.0f));
	triangleColors.push_back(egc::vec4(0.0f, 0.0f, 255.0f, 255.0f));

	validateComputeAlphaBetaGamma();

	SDL_zero(currentEvent);

	while (!quit) {
		//Handle events on queue
		while (SDL_PollEvent(&currentEvent))
		{
			//User requests quit
			if (currentEvent.type == SDL_EVENT_QUIT)
			{
				quit = true;
			}

			//Mouse event -> pressed button
			if (currentEvent.type == SDL_EVENT_MOUSE_BUTTON_DOWN)
			{
				if (currentEvent.button.button == SDL_BUTTON_LEFT)
				{
					//left mouse button was pressed
					SDL_GetMouseState(&mouseX, &mouseY);
					mouseX /= displayScale;
					mouseY /= displayScale;
				}
			}

			//Mouse event -> mouse movement
			if (currentEvent.type == SDL_EVENT_MOUSE_MOTION)
			{
				SDL_MouseButtonFlags mouseButtons = SDL_GetMouseState(nullptr, nullptr);
				if (mouseButtons & SDL_BUTTON_MASK(SDL_BUTTON_LEFT))
				{
					//left button pressed while moving
					SDL_GetMouseState(&mouseX, &mouseY);
					mouseX /= displayScale;
					mouseY /= displayScale;
				}
			}

			//Keyboard event
			if (currentEvent.type == SDL_EVENT_KEY_DOWN)
			{
				switch (currentEvent.key.key)
				{
				case SDLK_C:
					break;
				case SDLK_ESCAPE:
					quit = true;
					break;
				default:
					break;
				}
			}

			//Paint the white background
			SDL_SetRenderDrawColor(renderer, backgroundColor.r, backgroundColor.g, backgroundColor.b, backgroundColor.a);
			SDL_RenderClear(renderer);

			SDL_SetRenderDrawColor(renderer, 0, 0,255, 255);
			//Draw the triangle outline - this should give you an ideea about the location/size of the triangle
			SDL_RenderLine(renderer, triangle[0].x, triangle[0].y, triangle[1].x, triangle[1].y);
			SDL_RenderLine(renderer, triangle[1].x, triangle[1].y, triangle[2].x, triangle[2].y);
			SDL_RenderLine(renderer, triangle[2].x, triangle[2].y, triangle[0].x, triangle[0].y);

			//draw the filled triangle
			rasterizeTriangle(renderer, triangle, triangleColors);


			SDL_RenderPresent(renderer);
		}
	}

	destroyWindow();
	return 0;
}
