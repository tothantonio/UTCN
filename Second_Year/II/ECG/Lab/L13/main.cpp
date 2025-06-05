//
//  All the auxiliary code (window creation/destruction, validation method and others) has been moved to "auxiliary.h" to keep the main file as simple as possible
//
//  Copyright ? 2016 CGIS. All rights reserved.
//

#include <iostream>
#include <SDL3/SDL.h>

#include "auxiliary.h"
#include "rasterization.h"
#include "globalVars.h"

bool quit { false };

float mouseX { -1.0f }, mouseY { -1.0f };
float rotationAngle { 0.0f };


egc::mat4 viewTransformMatrix;
egc::mat4 cameraMatrix;
egc::mat4 perspectiveMatrix;
egc::mat4 modelMatrix;
egc::Camera myCamera;

egc::vec2 viewportTopLeftCorner { 30, 30 };
egc::vec2 viewportDimensions { 400, 400 };

bool backFaceCulling { true };
bool displayNormals { false };

egc::vec2 zMinMax;
float depthBuffer[WINDOW_WIDTH][WINDOW_HEIGHT];

float displayScale{ 1.0f };

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
	/*if (currentEvent.type == SDL_EVENT_MOUSE_MOTION)
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
			SDL_GetMouseState(&mouseX, &mouseY);
			mouseX /= displayScale;
			mouseY /= displayScale;
		}
	}*/
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

		case SDLK_A:
			rotationAngle -= 10.0f;
			break;

		case SDLK_D:
			rotationAngle += 10.0f;
			break;

		case SDLK_W:
			cameraZ -= 0.5f;
			break;

		case SDLK_S:
			cameraZ += 0.5f;
			break;

		case SDLK_Z:
			backFaceCulling = true;
			break;

		case SDLK_C:
			backFaceCulling = false;
			break;

		case SDLK_Q:
			displayNormals = true;
			break;

		case SDLK_E:
			displayNormals = false;
			break;

		default:
			break;
		}
	}
}

//draw a triangle line by line
void drawWireframeTriangle(SDL_Renderer *renderer, const std::vector<egc::vec4> &triangle)
{
	for (int i = 0; i < 3; i++)
		SDL_RenderLine(renderer, triangle.at((i + 1) % 3).x, triangle.at((i + 1) % 3).y, triangle.at(i).x, triangle.at(i).y);
}

void renderMesh(SDL_Renderer *renderer, std::vector<tinyobj::shape_t> shapes)
{
	egc::vec3 normalVector;
	egc::vec4 triangleCenter;

	int vertexId = -1;

	//for each mesh in the 3d model representation
	for (size_t i = 0; i < shapes.size(); i++) {
		//for each triangle
		std::vector<egc::vec4> triangle;
        std::vector<egc::vec4> triangleColors;
		for (size_t f = 0; f < shapes[i].mesh.indices.size() / 3; f++) {
			//update the triangle with vertices coordinates
			for (int k = 0; k < 3; k++)
			{
				vertexId = shapes[i].mesh.indices[3 * f + k];
				triangle.push_back(egc::vec4(shapes[i].mesh.positions[3 * vertexId + 0], shapes[i].mesh.positions[3 * vertexId + 1], shapes[i].mesh.positions[3 * vertexId + 2], 1));
                float colorCoeff = 255 * ((shapes[i].mesh.positions[3 * vertexId + 2] - zMinMax.x) / (zMinMax.y - zMinMax.x));
                triangleColors.push_back(egc::vec4(colorCoeff, colorCoeff, colorCoeff, 255.0f));
			}

			//compute the coordinates in view (camera) space
			for (int k = 0; k < 3; k++)
				triangle.at(k) = cameraMatrix * modelMatrix * triangle.at(k);

			//compute the normal vector and triangle center
			normalVector = findNormalVectorToTriangle(triangle);
			triangleCenter = findCenterPointOfTriangle(triangle);

			//apply back-face culling
			if (!isTriangleVisible(triangle, normalVector) && backFaceCulling)
			{
				//clear the triangle
				triangle.clear();
                triangleColors.clear();
				continue;
			}

			//apply the perspective matrix
			for (int k = 0; k < 3; k++)
				triangle.at(k) = perspectiveMatrix * triangle.at(k);

			if (clipTriangleInHomegeneousCoordinates(triangle))
			{
				//clear the triangle
				triangle.clear();
                triangleColors.clear();
				continue;
			}

			//apply the perspective divide and the viewport transformation matrix
			for (int k = 0; k < 3; k++)
			{
				egc::perspectiveDivide(triangle.at(k));

				triangle.at(k) = viewTransformMatrix * triangle.at(k);
			}

			//draw the triangle
            egc::rasterizeTriangle(renderer, triangle, triangleColors);

			//display the normal vectors
			if (displayNormals)
				displayNormalVectors(normalVector, triangleCenter, renderer, viewTransformMatrix, perspectiveMatrix);

			//clear the triangle
			triangle.clear();
            triangleColors.clear();
		}
	}
}

int main(int argc, char * argv[]) {
	if (!initWindow())
	{
		SDL_Log("Failed to initialize");
		return -1;
	}

	displayScale = SDL_GetDisplayContentScale(1);
	//Apply global display scaling to renderer
	SDL_SetRenderScale(renderer, displayScale, displayScale);

	myCamera = egc::Camera(egc::vec3(-0.3f, 1.5f, cameraZ), egc::vec3(-0.3f, 1.5f, -10.0f), egc::vec3(0.0f, 1.0f, 0.0f));
	viewTransformMatrix = egc::defineViewTransformMatrix(static_cast<int>(viewportTopLeftCorner.x), static_cast<int>(viewportTopLeftCorner.y), static_cast<int>(viewportDimensions.x), static_cast<int>(viewportDimensions.y));
	cameraMatrix = egc::defineCameraMatrix(myCamera);
	perspectiveMatrix = egc::definePerspectiveProjectionMatrix(45.0f, 1.0, -0.1f, -10.0f);

	//validateViewingTransformations();

    std::vector<tinyobj::shape_t> shapes = readOBJ("/media/toni/stuff/TUCN/UTCN/Second_Year/II/ECG/Lab/L13/bunny.obj");

    zMinMax = getZminZmax(shapes.at(0));

	SDL_FRect viewportRectangle = { viewportTopLeftCorner.x, viewportTopLeftCorner.y, viewportDimensions.x, viewportDimensions.y };

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
			SDL_SetRenderDrawColor(renderer, 224, 224, 224, 0);
			SDL_RenderClear(renderer);

			SDL_SetRenderDrawColor(renderer, 255, 0, 0, 0);
			SDL_RenderRect(renderer, &viewportRectangle);

			modelMatrix = egc::rotateY(rotationAngle) * egc::scale(15.0f, 15.0f, 15.0f);
			myCamera.cameraPosition.z = cameraZ;
			cameraMatrix = egc::defineCameraMatrix(myCamera);

            egc::clearDepthBuffer();

			SDL_SetRenderDrawColor(renderer, 255, 0, 0, 0);
			renderMesh(renderer, shapes);

			//Update screen
			SDL_RenderPresent(renderer);
		}
	}

	destroyWindow();
	return 0;
}

