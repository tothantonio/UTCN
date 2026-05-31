#version 410 core

layout(location = 0) in vec3 vertex_position;
layout(location = 1) in vec3 vertex_color;

out vec3 color_vs;

uniform float offsetX;
uniform float offsetY;

void main() {
    color_vs = vertex_color;
    gl_Position = vec4(vertex_position.x + offsetX, vertex_position.y + offsetY, vertex_position.z, 1.0);
}
