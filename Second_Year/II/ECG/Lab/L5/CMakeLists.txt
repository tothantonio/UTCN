cmake_minimum_required(VERSION 3.30)
project(L5)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED True)
find_package(SDL3 REQUIRED)

set(PROJECT_HEADERS
        transform.h
        vec2.h
        ../L6/vec3.h
        ../L6/vec4.h
        mat3.h
        mat4.h
        polygon.h
)
set(PROJECT_SOURCES
        main.cpp
        polygon.cpp
)

add_executable(untitled1 ${PROJECT_SOURCES} ${PROJECT_HEADERS})

add_executable(L5 ${PROJECT_SOURCES} ${PROJECT_HEADES})
target_link_libraries(${PROJECT_NAME} PRIVATE SDL3::SDL3)
