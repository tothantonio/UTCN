// EGC_Bresenham.cpp : Defines the entry point for the console application.
//
//  Created by CGIS on 12/02/2025.
//  Copyright ? 2025 CGIS. All rights reserved.
//

#include <SDL3/SDL.h>
#include <iostream>
#include <vector>
#include "Bezier.h"

//define window dimensions
constexpr int WINDOW_WIDTH { 640 };
constexpr int WINDOW_HEIGHT { 480 };

//The window
SDL_Window* window { nullptr };
//The window renderer
SDL_Renderer* renderer { nullptr };
SDL_Event currentEvent;

SDL_Color backgroundColor{ 255, 255, 255, 255 };
SDL_Color controlPointsColor{ 0, 0, 0, 255 };
SDL_Color curveColor{ 0, 0, 255, 255 };

bool quit { false };
float mouseX { -1.0f }, mouseY { -1.0f };

float displayScale{ 1.0f };

std::vector<vec2> controlPoints;

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
	///Destroy renderer
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

void handleMouseEvents()
{
	//Mouse event -> pressed button
	if (currentEvent.type == SDL_EVENT_MOUSE_BUTTON_DOWN)
	{
		if (currentEvent.button.button == SDL_BUTTON_LEFT)
		{
			SDL_GetMouseState(&mouseX, &mouseY);
			mouseX /= displayScale;
			mouseY /= displayScale;
		}

		if (currentEvent.button.button == SDL_BUTTON_RIGHT)
		{
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
			SDL_GetMouseState(&mouseX, &mouseY);
			mouseX /= displayScale;
			mouseY /= displayScale;
			
		}

		if (mouseButtons & SDL_BUTTON_MASK(SDL_BUTTON_RIGHT))
		{
			//SDL_GetMouseState(&mouseX, &mouseY);
			//mouseX /= displayScale;
			//mouseY /= displayScale;
		}
	}
}

void handleKeyboardEvents()
{
	//Keyboard event
	if (currentEvent.type == SDL_EVENT_KEY_DOWN)
	{
		switch (currentEvent.key.key)
		{
		case SDLK_ESCAPE:
			quit = true;
			break;

		default:
			break;
		}
	}
}


int main(int argc, char * argv[]) {
	if (!initWindow())
	{
		SDL_Log("Failed to initialize");
		return -1;
	}

	controlPoints.push_back(egc::vec2(50.0f,400.0f));
	controlPoints.push_back(egc::vec2(150.0f, 50.0f));
	controlPoints.push_back(egc::vec2(500.0f, 400.0f));

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

			handleMouseEvents();
			handleKeyboardEvents();

			//Clear screen
			SDL_SetRenderDrawColor(renderer, backgroundColor.r, backgroundColor.g, backgroundColor.b, backgroundColor.a);
			SDL_RenderClear(renderer);



			/****************************************************************************************************/
			/*                                   Parametric line render                                         */
			/****************************************************************************************************/
			//Paint the pixels along the line formed by points (400, 70) and (600, 400) 
			SDL_SetRenderDrawColor(renderer, controlPointsColor.r, controlPointsColor.g, controlPointsColor.b, controlPointsColor.a);
			drawParametricLinePoints(egc::vec2(400.0f, 70.0f), egc::vec2(600.0f, 400.0f), renderer);
			

			/****************************************************************************************************/
			/*                                     Bezier curve render                                          */
			/****************************************************************************************************/
			//Draw the lines formed by the control points
			//SDL_SetRenderDrawColor(renderer, 0x00, 0x00, 0xFF, 0xFF);
			//for (int i = 0; i < controlPoints.size() - 1; i++)
				//SDL_RenderDrawLine(renderer, controlPoints[i].x, controlPoints[i].y, controlPoints[i + 1].x, controlPoints[i + 1].y);
			SDL_SetRenderDrawColor(renderer, curveColor.r, curveColor.g, curveColor.b, curveColor.a);
			drawBezierPoints(controlPoints, renderer);

			//Update screen
			SDL_RenderPresent(renderer);
		}
	}

	destroyWindow();
	return 0;
}