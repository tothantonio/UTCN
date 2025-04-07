cmake_minimum_required(VERSION 3.30)
project(L6)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED True)
find_package(SDL3 REQUIRED)

set(PROJECT_HEADERS
        vec3.h
        vec4.h
        clip.h
)
set(PROJECT_SOURCES
        main.cpp
        clip.cpp
)

add_executable(untitled1 ${PROJECT_SOURCES} ${PROJECT_HEADERS})

add_executable(L6 ${PROJECT_SOURCES} ${PROJECT_HEADES})
target_link_libraries(${PROJECT_NAME} PRIVATE SDL3::SDL3)
