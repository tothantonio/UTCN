cmake_minimum_required(VERSION 3.30)
project(L13)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED True)
find_package(SDL3 REQUIRED)

set(PROJECT_HEADERS
        auxiliary.h
        camera.h
        globalVars.h
        mat4.h
        mat3.h
        projection.h
        rasterization.h
        tiny_obj_loader.h
        transform.h
        vec3.h
        vec4.h
        vec2.h
)
set(PROJECT_SOURCES
        main.cpp
        camera.cpp
        projection.cpp
        rasterization.cpp
)

add_executable(L13 ${PROJECT_SOURCES} ${PROJECT_HEADES})
target_link_libraries(${PROJECT_NAME} PRIVATE SDL3::SDL3)