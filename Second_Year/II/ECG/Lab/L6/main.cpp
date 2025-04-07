//  SDL_TestClip
//
//  Created by CGIS on 16/02/2025.
//  Copyright � 2025 CGIS. All rights reserved.
//
//  This is a test setup for your clipping algorithm implementation
//  This application draws the clipping window beteen the points (250,200) and (550, 400)
//  You can draw the line that you want to clip with a "drag-n-drop" action within the window
//
//  To apply the Cohen-Sutherland algorithm to your line, press the 'c' key.
//  This will invoke the function implementation from the "clip.cpp" file. 
//  You must implement the functions within that file!!!! 
//  Check "clip.h" and the Laboratory work for clues about the implemntation
//

/************************************************* IMPORTANT *********************************************************/
//  !!!!! ADD ALL OF YOUR IMPLEMENTED SOURCES -> vec3, vec4, mat3, mat4, transform (".h" and ".cpp") files !!!!!!
//
/*******************************************************************************************************************/

#include <iostream>
#include <SDL3/SDL.h>
#include "clip.h"

using namespace egc;

// define rectangle vertices
vec3 p1 { 0.0f, 0.0f, 1.0f };
vec3 p2 { 0.0f, 0.0f, 1.0f };

//define clipping window
std::vector<vec3> clipWindow;

//define window dimensions
constexpr int WINDOW_WIDTH = 800;
constexpr int WINDOW_HEIGHT = 600;

SDL_Window* window { nullptr };
SDL_Renderer* renderer { nullptr };
SDL_Event currentEvent;

SDL_Color backgroundColor { 255,255,255,255 };
SDL_Color clippingWindowColor { 0, 128, 0, 255 };
SDL_Color lineColor { 0, 0, 255,255 };

bool quit { false };

float mouseX { -1.0f }, mouseY { -1.0f };

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

//Create the corners of the clipping window (drawn as a rectangle)
void initClipWindow()
{
	clipWindow.push_back(vec3(250.0f, 200.0f, 1.0f));
	clipWindow.push_back(vec3(550.0f, 200.0f, 1.0f));
	clipWindow.push_back(vec3(550.0f, 400.0f, 1.0f));
	clipWindow.push_back(vec3(250.0f, 400.0f, 1.0f));
}

int main(int argc, char * argv[]) {

	if (!initWindow())
	{
		SDL_Log("Failed to initialize");
		return -1;
	}

	initClipWindow();

	std::cout << "Draw the line you want to clip witha drang-n-drop mouse action!" << "\n";
	std::cout << "Press the \'c\' key to apply the Cohen-Sutherland clipping algorithm!" << "\n\n";

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
					p1.x = p2.x = mouseX;
					p1.y = p2.y = mouseY;
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
					p2.x = mouseX;
					p2.y = mouseY;
				}
			}

			//Keyboard event
			if (currentEvent.type == SDL_EVENT_KEY_DOWN)
			{
				switch (currentEvent.key.key)
				{
				case SDLK_C:
					std::cout << "Applying Cohen-Sutherland clipping" << "\n";
					//Applies the Cohen-Sutherland clipping algorithm -> implemented by you
					if (lineClip_CohenSutherland(clipWindow, p1, p2) == -1)
						p1.x = p2.x = p1.y = p2.y = 0.0f;
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

			//draw the clipping window
			SDL_SetRenderDrawColor(renderer, clippingWindowColor.r, clippingWindowColor.g, clippingWindowColor.b, clippingWindowColor.a);
			for (size_t i = 0; i < clipWindow.size(); i++)
				SDL_RenderLine(
					renderer,
					clipWindow.at(i).x,
					clipWindow.at(i).y,
					clipWindow.at((i + 1) % clipWindow.size()).x,
					clipWindow.at((i + 1) % clipWindow.size()).y);

			//draw the line
			SDL_SetRenderDrawColor(renderer, lineColor.r, lineColor.g, lineColor.b, lineColor.a);
			SDL_RenderLine(renderer, p1.x, p1.y, p2.x, p2.y);

			SDL_RenderPresent(renderer);
		}
	}

	destroyWindow();
	return 0;
}