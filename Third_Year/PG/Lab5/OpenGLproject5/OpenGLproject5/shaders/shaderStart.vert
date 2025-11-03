#version 410 core

layout(location = 0) in vec3 vertexPosition;
layout(location = 1) in vec3 vertexColour;

out vec3 color;
uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

void main() {
    color = vertexColour;
    gl_Position = projection * view * model * vec4(vertexPosition, 1.0);
}

