cmake_minimum_required(VERSION 3.30)
project(L2)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED True)

find_package(SDL3 REQUIRED)

add_executable(L2 main.cpp)
target_link_libraries(${PROJECT_NAME} PRIVATE SDL3::SDL3)
