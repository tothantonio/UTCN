cmake_minimum_required(VERSION 3.30)
project(L12)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED True)
find_package(SDL3 REQUIRED)

set(PROJECT_HEADERS
        rasterization.h
        Validator.h
        vec3.h
        vec2.h
        vec4.h
)
set(PROJECT_SOURCES
        main.cpp
        rasterization.cpp
)

add_executable(L12 ${PROJECT_SOURCES} ${PROJECT_HEADES})
target_link_libraries(${PROJECT_NAME} PRIVATE SDL3::SDL3)