// EGC_Bresenham.cpp : Defines the entry point for the console application.
//
//  Created by CGIS on 13/04/2020.
//  Copyright © 2020 CGIS. All rights reserved.
//

#include <iostream>
#include <SDL3/SDL.h>
#include "bresenham.h"

//define window dimensions
constexpr int WINDOW_WIDTH { 640 };
constexpr int WINDOW_HEIGHT { 480 };

//The window
SDL_Window* window { nullptr };
//The window renderer
SDL_Renderer* renderer { nullptr };
SDL_Event currentEvent;

SDL_Color backgroundColor { 255, 255, 255, 255 };
SDL_Color lineColor { 0, 0, 0, 255 };
SDL_Color circleColor { 0, 255, 255, 255 };

bool quit { false };
float mouseX { -1.0f }, mouseY { -1.0f };

BresenhamLine myLine;
BresenhamCircle myCircle;

float displayScale { 1.0f };

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
			myLine.startX = myLine.endX = mouseX;
			myLine.startY = myLine.endY = mouseY;
		}

		if (currentEvent.button.button == SDL_BUTTON_RIGHT)
		{
			SDL_GetMouseState(&mouseX, &mouseY);
			mouseX /= displayScale;
			mouseY /= displayScale;
			myCircle.centerX = mouseX;
			myCircle.centerY = mouseY;
			myCircle.radius = 0.0f;
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
			myLine.endX = mouseX;
			myLine.endY = mouseY;
		}

		if (mouseButtons & SDL_BUTTON_MASK(SDL_BUTTON_RIGHT))
		{
			SDL_GetMouseState(&mouseX, &mouseY);
			mouseX /= displayScale;
			mouseY /= displayScale;
			myCircle.radius = sqrt((mouseX - myCircle.centerX) * (mouseX - myCircle.centerX) +
				(mouseY - myCircle.centerY) * (mouseY - myCircle.centerY));
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

			//Draw Bresenham line
			SDL_SetRenderDrawColor(renderer, lineColor.r, lineColor.g, lineColor.b, lineColor.a);
			BresenhamDraw(myLine, renderer);

			//Draw Bresenham circle
			SDL_SetRenderDrawColor(renderer, circleColor.r, circleColor.g, circleColor.b, circleColor.a);
			BresenhamDraw(myCircle, renderer);

			//Update screen
			SDL_RenderPresent(renderer);
		}
	}

	destroyWindow();
	return 0;
}