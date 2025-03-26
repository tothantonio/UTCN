#include <iostream>
#include <SDL3/SDL.h>
#include "transform.h"
#include "polygon.h"

using namespace egc;

//define window dimensions
constexpr int WINDOW_WIDTH { 640 };
constexpr int WINDOW_HEIGHT { 480 };

SDL_Window* window { nullptr };
SDL_Renderer* renderer { nullptr };
SDL_Event currentEvent;

SDL_Color backgroundColor{ 255, 255, 255, 255 };

bool quit { false };

float mouseX { -1.0f }, mouseY { -1.0f };

float displayScale { 1.0f };

polygon p;

bool initWindow()
{
    bool success{ true };

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

void initPolygon() {

    p.addVertex(vec3(100.0f, 100.0f, 1.0f));
    p.addVertex(vec3(400.0f, 100.0f, 1.0f));
}

void processEvents() {

    //Check for events in queue
    while (SDL_PollEvent(&currentEvent)) {
        
        //User requests quit
        if(currentEvent.type == SDL_EVENT_QUIT) {
            
            quit = true;
        }
        
        //Mouse event -> pressed button
        if(currentEvent.type == SDL_EVENT_MOUSE_BUTTON_DOWN) {
            
            if(currentEvent.button.button == SDL_BUTTON_LEFT) {
                
                SDL_GetMouseState(&mouseX, &mouseY);
                mouseX /= displayScale;
                mouseY /= displayScale;
                std::cout << "Mouse click => " << "x: " << mouseX << ", y: " << mouseY << std::endl;
            }
        }
        
        //Mouse event -> mouse movement
        if(currentEvent.type == SDL_EVENT_MOUSE_MOTION) {
            
            SDL_MouseButtonFlags mouseButtons = SDL_GetMouseState(nullptr, nullptr);
            if (mouseButtons & SDL_BUTTON_MASK(SDL_BUTTON_LEFT)) {
                
                SDL_GetMouseState(&mouseX, &mouseY);
                mouseX /= displayScale;
                mouseY /= displayScale;
                std::cout << "Mouse move => " << "x: " << mouseX << ", y: " << mouseY << std::endl;
            }
        }
        
        //Keyboard event
        if(currentEvent.type == SDL_EVENT_KEY_DOWN) {
            
            switch(currentEvent.key.key) {
                    
                case SDLK_UP:
                    break;
                    
                case SDLK_R:
                    break;
                    
                case SDLK_ESCAPE:
                    
                    quit = true;
                    break;
                    
                default:
                    break;
            }
        }
    }
}

void drawFrame() {

    //Clear the background
    SDL_SetRenderDrawColor(renderer, backgroundColor.r, backgroundColor.g, backgroundColor.b, backgroundColor.a);
    SDL_RenderClear(renderer);

    p.draw(renderer);

    //Update window
    SDL_RenderPresent(renderer);
}

void cleanup() {

    //Clear polygon
    p.clearVertices();

    //Destroy renderer
    if (renderer) {

        SDL_DestroyRenderer(renderer);
        renderer = nullptr;
    }

    //Destroy window
    if (window) {

        SDL_DestroyWindow(window);
        window = nullptr;
    }

    //Quit SDL
    SDL_Quit();
}

int main(int argc, char * argv[]) {
    //Initialize window
    if(!initWindow()) {

        SDL_Log("Failed to initialize");
        return -1;
    }

    //Initialize polygon
    initPolygon();

    SDL_zero(currentEvent);

    //Game loop
    while (!quit) {

        processEvents();
        drawFrame();
    }

    cleanup();
    return 0;
}
