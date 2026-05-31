#version 410 core

out vec4 frag_color;

in vec3 color_vs;

void main() {
	frag_color = vec4(color_vs, 1.0);
}
