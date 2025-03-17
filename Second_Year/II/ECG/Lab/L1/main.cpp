//
//  main.cpp
//  SDL_Lab1
//
//  Created by CGIS on 16/02/25.
//  Copyright © 2025 CGIS. All rights reserved.
//

#include <iostream>
#include <SDL3/SDL.h>

//define window dimensions
constexpr int WINDOW_WIDTH { 640 };
constexpr int WINDOW_HEIGHT { 480 };

SDL_Window* window { nullptr };
SDL_Renderer* renderer { nullptr };
SDL_Event currentEvent;

SDL_FRect rectangleCoordinates {100, 100, 200, 200};
SDL_Color rectangleColor { 255, 0, 0, 255 }; // Default red color
SDL_Color backgroundColor { 255, 255, 255, 255 };

bool quit { false };

float mouseX { -1.0f }, mouseY { -1.0f };
float startX { -1.0f }, startY { -1.0f }; // Starting point for drag

float displayScale { 1.0f };

// Current color channel being modified (0 = Red, 1 = Green, 2 = Blue)
int currentColorChannel { 0 };

bool isDragging { false };

bool initWindow()
{
    bool success { true };

    //Try to initialize SDL
    if(!SDL_Init(SDL_INIT_VIDEO))
    {
        SDL_Log("SDL initialization failed: %s\n", SDL_GetError());
        success = false;
    }
    else{
        //Try to create the window and renderer
        displayScale = SDL_GetDisplayContentScale(1);

        if(!SDL_CreateWindowAndRenderer(
                "SDL Rectangle Drawing Tool",
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

    if(!initWindow())
    {
        SDL_Log("Failed to initialize");
        return -1;
    }

    SDL_zero(currentEvent);

    while (!quit) {
        //Handle events on queue
        while(SDL_PollEvent(&currentEvent))
        {
            //User requests quit
            if(currentEvent.type == SDL_EVENT_QUIT)
            {
                quit = true;
            }

            //Mouse event -> pressed button
            if(currentEvent.type == SDL_EVENT_MOUSE_BUTTON_DOWN)
            {
                if(currentEvent.button.button == SDL_BUTTON_LEFT)
                {
                    SDL_GetMouseState(&mouseX, &mouseY);
                    mouseX /= displayScale;
                    mouseY /= displayScale;

                    // Store starting point for rectangle
                    startX = mouseX;
                    startY = mouseY;
                    isDragging = true;

                    std::cout << "Started drawing at => " << "x: " << startX << ", y: " << startY << std::endl;
                }
            }

            // Mouse event -> released button
            if(currentEvent.type == SDL_EVENT_MOUSE_BUTTON_UP)
            {
                if(currentEvent.button.button == SDL_BUTTON_LEFT)
                {
                    isDragging = false;
                    std::cout << "Finished drawing rectangle" << std::endl;
                }
            }

            //Mouse event -> mouse movement
            if(currentEvent.type == SDL_EVENT_MOUSE_MOTION && isDragging)
            {
                SDL_GetMouseState(&mouseX, &mouseY);
                mouseX /= displayScale;
                mouseY /= displayScale;

                // Calculate rectangle dimensions based on drag
                float width = mouseX - startX;
                float height = mouseY - startY;

                // Handle negative dimensions (when dragging up or left)
                if (width < 0) {
                    rectangleCoordinates.x = mouseX;
                    rectangleCoordinates.w = -width;
                } else {
                    rectangleCoordinates.x = startX;
                    rectangleCoordinates.w = width;
                }

                if (height < 0) {
                    rectangleCoordinates.y = mouseY;
                    rectangleCoordinates.h = -height;
                } else {
                    rectangleCoordinates.y = startY;
                    rectangleCoordinates.h = height;
                }

                std::cout << "Dragging rectangle => " << "width: " << rectangleCoordinates.w
                          << ", height: " << rectangleCoordinates.h << std::endl;
            }

            //Keyboard event
            if(currentEvent.type == SDL_EVENT_KEY_DOWN)
            {
                switch(currentEvent.key.key)
                {
                    case SDL_SCANCODE_R: // Equivalent to 'r'
                        currentColorChannel = 0; // Red channel
                        std::cout << "Selected Red channel" << std::endl;
                        break;

                    case SDL_SCANCODE_G: // Equivalent to 'g'
                        currentColorChannel = 1; // Green channel
                        std::cout << "Selected Green channel" << std::endl;
                        break;

                    case SDL_SCANCODE_B: // Equivalent to 'b'
                        currentColorChannel = 2; // Blue channel
                        std::cout << "Selected Blue channel" << std::endl;
                        break;

                    case SDL_SCANCODE_UP: // Up arrow
                        // Increase the selected color channel (with upper limit)
                        if (currentColorChannel == 0 && rectangleColor.r < 255)
                            rectangleColor.r += 5;
                        else if (currentColorChannel == 1 && rectangleColor.g < 255)
                            rectangleColor.g += 5;
                        else if (currentColorChannel == 2 && rectangleColor.b < 255)
                            rectangleColor.b += 5;

                        std::cout << "Color: R=" << (int)rectangleColor.r
                                  << " G=" << (int)rectangleColor.g
                                  << " B=" << (int)rectangleColor.b << std::endl;
                        break;

                    case SDL_SCANCODE_DOWN: // Down arrow
                        // Decrease the selected color channel (with lower limit)
                        if (currentColorChannel == 0 && rectangleColor.r > 0)
                            rectangleColor.r -= 5;
                        else if (currentColorChannel == 1 && rectangleColor.g > 0)
                            rectangleColor.g -= 5;
                        else if (currentColorChannel == 2 && rectangleColor.b > 0)
                            rectangleColor.b -= 5;

                        std::cout << "Color: R=" << (int)rectangleColor.r
                                  << " G=" << (int)rectangleColor.g
                                  << " B=" << (int)rectangleColor.b << std::endl;
                        break;
                }
            }
        }

        // Clear screen with background color
        SDL_SetRenderDrawColor(renderer, backgroundColor.r, backgroundColor.g, backgroundColor.b, backgroundColor.a);
        SDL_RenderClear(renderer);

        // Draw the rectangle with current color
        SDL_SetRenderDrawColor(renderer, rectangleColor.r, rectangleColor.g, rectangleColor.b, rectangleColor.a);
        SDL_RenderFillRect(renderer, &rectangleCoordinates);

        // Present the rendered frame
        SDL_RenderPresent(renderer);
    }

    destroyWindow();
    return 0;
}