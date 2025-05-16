cmake_minimum_required(VERSION 3.30)
project(L11)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED True)
find_package(SDL3 REQUIRED)

set(PROJECT_HEADERS
        vec2.h
        vec3.h
        vec4.h
        camera.h
        mat3.h
        mat4.h
        projection.h
        tiny_obj_loader.h
        transform.h
)
set(PROJECT_SOURCES
        main.cpp
        camera.cpp
        projection.cpp
)

add_executable(L11 ${PROJECT_SOURCES} ${PROJECT_HEADES})
target_link_libraries(${PROJECT_NAME} PRIVATE SDL3::SDL3)