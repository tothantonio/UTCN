#pragma once

#include <iostream>
#include <SDL3/SDL.h>

#include "mat4.h"
#include "vec4.h"
#include "transform.h"
#include "camera.h"
#include "projection.h"

#define TINYOBJLOADER_IMPLEMENTATION // define this in only *one* .cc
#include "tiny_obj_loader.h"

//define window dimensions
constexpr int WINDOW_WIDTH { 512 };
constexpr int WINDOW_HEIGHT { 512 };

//The window
SDL_Window* window { nullptr };
//The window renderer
SDL_Renderer* renderer { nullptr };
SDL_Event currentEvent;
float cameraZ { 3.0f };

std::vector<tinyobj::shape_t> readOBJ(std::string inputfile)
{
	std::vector<tinyobj::shape_t> shapes;
	std::vector<tinyobj::material_t> materials;

	std::string err;	
	bool ret = tinyobj::LoadObj(shapes, materials, err, inputfile.c_str());

	if (!err.empty()) { // `err` may contain warning message.
		std::cerr << err << std::endl;
	}

	if (!ret) {
		exit(1);
	}

#ifdef PRINTINFO
	std::cout << "# of shapes    : " << shapes.size() << std::endl;
	std::cout << "# of materials : " << materials.size() << std::endl;

	for (size_t i = 0; i < shapes.size(); i++) {
		printf("shape[%ld].name = %s\n", i, shapes[i].name.c_str());
		printf("Size of shape[%ld].indices: %ld\n", i, shapes[i].mesh.indices.size());
		printf("Size of shape[%ld].material_ids: %ld\n", i, shapes[i].mesh.material_ids.size());

		assert((shapes[i].mesh.indices.size() % 3) == 0);
		for (size_t f = 0; f < shapes[i].mesh.indices.size() / 3; f++) {
			printf("  idx[%ld] = %d, %d, %d. mat_id = %d\n", f, shapes[i].mesh.indices[3 * f + 0], shapes[i].mesh.indices[3 * f + 1], shapes[i].mesh.indices[3 * f + 2], shapes[i].mesh.material_ids[f]);
		}

		printf("shape[%ld].vertices: %ld\n", i, shapes[i].mesh.positions.size());
		assert((shapes[i].mesh.positions.size() % 3) == 0);
		for (size_t v = 0; v < shapes[i].mesh.positions.size() / 3; v++) {
			printf("  v[%ld] = (%f, %f, %f)\n", v,
				shapes[i].mesh.positions[3 * v + 0],
				shapes[i].mesh.positions[3 * v + 1],
				shapes[i].mesh.positions[3 * v + 2]);
		}
	}
#endif
	return shapes;
}

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
		float displayScale { SDL_GetDisplayContentScale(1) };

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

void validateViewingTransformations()
{
	float a1[] = { 300.0f, 0.0f, 0.0f, 0.0f, 0.0f, -300.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 350.0f, 350.0f, 0.0f, 1.0f };

	egc::mat4 m1(a1), m2;

	m2 = egc::defineViewTransformMatrix(50, 50, 600, 600);
	if (m1 == m2)
		std::cout << "Correct viewTransformMatrix" << std::endl;
	else
		std::cout << "Incorrect viewTransformMatrix" << std::endl;

	float a2[] = { 1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.920967f, 0.38964f, 0.0f, 0.0f, -0.38964f, 0.920967f, 1.0f, 0.3f, -3.8964f, -4.90592f, 1.0f };

	egc::mat4 m3(a2), m4;

	egc::Camera tempCamera;
	tempCamera = egc::Camera(egc::vec3(-0.3f, 5.5f, cameraZ), egc::vec3(-0.3f, 0.0f, -10.0f), egc::vec3(0.0f, 1.0f, 0.0f));
	m4 = egc::defineCameraMatrix(tempCamera);

	if (m3 == m4)
		std::cout << "Correct camera matrix" << std::endl;
	else
		std::cout << "Incorrect camera matrix" << std::endl;

	float a3[] = { -0.61737f, 0.0f, 0.0f, 0.0f, 0.0f, -0.61737f, 0.0f, 0.0f, 0.0f, 0.0f, -1.002f, 1.0f, 0.0f, 0.0f, -0.2002f, 0.0f };

	egc::mat4 m5(a3), m6;

	m6 = egc::definePerspectiveProjectionMatrix(90.0f, 1.0, -0.1f, -100.0f);

	if (m5 == m6)
		std::cout << "Correct perspective matrix" << std::endl;
	else
		std::cout << "Incorrect perspective matrix" << std::endl;

	egc::vec4 v(150, 330, 10, 5);
	egc::perspectiveDivide(v);
	egc::vec4 v1(30, 66, 2, 1);
	float w = v.w;

	if (v.x == v1.x && v.y == v1.y  && v.z == v1.z  && v.w == v1.w) {
		std::cout << "Correct perspective divide" << std::endl;
	}
	else {
		std::cout << "Incorrect perspective divide" << std::endl;
	}
}
