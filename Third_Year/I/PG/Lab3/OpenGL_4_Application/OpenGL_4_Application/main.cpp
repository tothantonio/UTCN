//
//  main.cpp
//  OpenGL_Shader_Example_step1
//
//  Created by CGIS on 30/11/15.
//  Copyright © 2015 CGIS. All rights reserved.
//

#if defined (__APPLE__)
    #define GLFW_INCLUDE_GLCOREARB
    #define GL_SILENCE_DEPRECATION
#else
    #define GLEW_STATIC
    #include <GL/glew.h>
#endif

#include <GLFW/glfw3.h>

#include <iostream>
#include <fstream>
#include <sstream>
#include <string>

//vertex coordinates in normalized device coordinates
GLfloat vertexCoordinates[] = {
    0.5f, -0.5f, 0.0f, // A
    0.5f, 0.5f, 0.0f, // B
    -0.5f, -0.5f, 0.0f // C
};

GLfloat vertex2Coordinates[] = {
    0.5f, 0.5f, 0.0f,
   -0.5f, -0.5f, 0.0f,
    -0.5f, 0.5f, 0.0f
};

GLuint verticesVBO;
GLuint triangleVAO;

GLuint vertices2VBO;
GLuint triangle2VAO;

int glWindowWidth = 640;
int glWindowHeight = 480;
int retina_width, retina_height;
GLFWwindow* glWindow = NULL;

GLuint shaderProgram;
GLuint shaderProgram2;

GLuint currShaderTriangle1;
GLuint currShaderTriangle2;

void windowResizeCallback(GLFWwindow* window, int width, int height)
{
    fprintf(stdout, "window resized to width: %d , and height: %d\n", width, height);
    //TODO
}

void initObjects()
{
    //generate a unique ID corresponding to the verticesVBO
    glGenBuffers(1, &verticesVBO);
    //bind the verticesVBO buffer to the GL_ARRAY_BUFFER target,
    //any further buffer call made to GL_ARRAY_BUFFER will configure the
    //currently bound buffer, which is verticesVBO
    glBindBuffer(GL_ARRAY_BUFFER, verticesVBO);
    //copy data into the currently bound buffer, the first argument specify
    //the type of the buffer, the second argument specify the size (in bytes) of data ,
    //the third argument is the actual data we want to send,
    //the last argument specify how should the graphic card manage the data
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertexCoordinates), vertexCoordinates, GL_STATIC_DRAW);
    //generate a unique ID corresponding to the triangleVAO
    glGenVertexArrays(1, &triangleVAO);
    glBindVertexArray(triangleVAO);
    glBindBuffer(GL_ARRAY_BUFFER, verticesVBO);
    //set the vertex attributes pointers
    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 0, NULL);
    glEnableVertexAttribArray(0);
    //unbind the triangleVAO
    glBindVertexArray(0);

	glGenBuffers(1, &vertices2VBO);
	glBindBuffer(GL_ARRAY_BUFFER, vertices2VBO);
	glBufferData(GL_ARRAY_BUFFER, sizeof(vertex2Coordinates), vertex2Coordinates, GL_STATIC_DRAW);
	glGenVertexArrays(1, &triangle2VAO);
	glBindVertexArray(triangle2VAO);
	glBindBuffer(GL_ARRAY_BUFFER, vertices2VBO);
	glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 0,NULL);
	glEnableVertexAttribArray(0);
	glBindVertexArray(0);
}

bool initOpenGLWindow()
{
    if (!glfwInit()) {
        fprintf(stderr, "ERROR: could not start GLFW3\n");
        return false;
    }

    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 4);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 1);
    glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);

    //window scaling for HiDPI displays
    glfwWindowHint(GLFW_SCALE_TO_MONITOR, GLFW_TRUE);

    // for multisampling/antialising
    glfwWindowHint(GLFW_SAMPLES, 4);

    glWindow = glfwCreateWindow(glWindowWidth, glWindowHeight, "OpenGL Shader Example", NULL, NULL);
    if (!glWindow) {
        fprintf(stderr, "ERROR: could not open window with GLFW3\n");
        glfwTerminate();
        return false;
    }

    glfwSetWindowSizeCallback(glWindow, windowResizeCallback);
    glfwMakeContextCurrent(glWindow);

#if not defined (__APPLE__)
    // start GLEW extension handler
    glewExperimental = GL_TRUE;
    glewInit();
#endif

    // get version info
    const GLubyte* renderer = glGetString(GL_RENDERER); // get renderer string
    const GLubyte* version = glGetString(GL_VERSION); // version as a string
    printf("Renderer: %s\n", renderer);
    printf("OpenGL version supported %s\n", version);

    //for RETINA display
    glfwGetFramebufferSize(glWindow, &retina_width, &retina_height);

    return true;
}

void renderScene()
{
    //clear the color and depth buffer before rendering the current frame
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    //specify the background color
    glClearColor(0.8, 0.8, 0.8, 1.0);
    //specify the viewport location and dimension
    glViewport(0, 0, retina_width, retina_height);
    //process the keyboard inputs
    if (glfwGetKey(glWindow, GLFW_KEY_A)) {
        if (currShaderTriangle1 == shaderProgram) {
			currShaderTriangle1 = shaderProgram2;
        } else {
			currShaderTriangle1 = shaderProgram;
        }
    }
    if (glfwGetKey(glWindow, GLFW_KEY_D)) {
        if (currShaderTriangle2 == shaderProgram) {
            currShaderTriangle2 = shaderProgram2;
        }
		else {
			currShaderTriangle2 = shaderProgram;
        }
    }
    //bind the shader program , any further rendering call
    //will use this shader program
    glUseProgram(currShaderTriangle1);
    //bind the VAO
    glBindVertexArray(triangleVAO);
    //specify the type of primitive, the starting index and
    //the number of indices to be rendered
    glDrawArrays(GL_TRIANGLES, 0, 3);

	//glBindVertexArray(0); // unbind the VAO1, nu e necesar

    glUseProgram(currShaderTriangle2);
	glBindVertexArray(triangle2VAO);
    glDrawArrays(GL_TRIANGLES, 0, 3);
}

std::string readShaderFile(std::string fileName)
{
    std::ifstream shaderFile;
    std::string shaderString;

    //open shader file
    shaderFile.open(fileName);

    std::stringstream shaderStringStream;

    //read shader content into stream
    shaderStringStream << shaderFile.rdbuf();

    //close shader file
    shaderFile.close();

    //convert stream into GLchar array
    shaderString = shaderStringStream.str();
    return shaderString;
}

void shaderCompileLog(GLuint shaderId)
{
    GLint success;
    GLchar infoLog[512];

    //check compilation info
    glGetShaderiv(shaderId, GL_COMPILE_STATUS, &success);
    if (!success)
    {
        glGetShaderInfoLog(shaderId, 512, NULL, infoLog);
        std::cout << "Shader compilation error\n" << infoLog << std::endl;
    }
}

void shaderLinkLog(GLuint shaderProgramId)
{
    GLint success;
    GLchar infoLog[512];

    //check linking info
    glGetProgramiv(shaderProgramId, GL_LINK_STATUS, &success);
    if (!success) {
        glGetProgramInfoLog(shaderProgram, 512, NULL, infoLog);
        std::cout << "Shader linking error\n" << infoLog << std::endl;
    }
}

GLuint initBasicShader(std::string vertexShaderFileName, std::string fragmentShaderFileName)
{
    GLuint shaderProgram;

    //read, parse and compile the vertex shader
    std::string v = readShaderFile(vertexShaderFileName);
    const GLchar* vertexShaderString = v.c_str();
    GLuint vertexShader;
    vertexShader = glCreateShader(GL_VERTEX_SHADER);
    glShaderSource(vertexShader, 1, &vertexShaderString, NULL);
    glCompileShader(vertexShader);
    //check compilation status
    shaderCompileLog(vertexShader);

    //read, parse and compile the fragment shader
    std::string f = readShaderFile(fragmentShaderFileName);
    const GLchar* fragmentShaderString = f.c_str();
    GLuint fragmentShader;
    fragmentShader = glCreateShader(GL_FRAGMENT_SHADER);
    glShaderSource(fragmentShader, 1, &fragmentShaderString, NULL);
    glCompileShader(fragmentShader);
    //check compilation status
    shaderCompileLog(fragmentShader);

    //attach and link the shader programs
    shaderProgram = glCreateProgram();
    glAttachShader(shaderProgram, vertexShader);
    glAttachShader(shaderProgram, fragmentShader);
    glLinkProgram(shaderProgram);
    glDeleteShader(vertexShader);
    glDeleteShader(fragmentShader);
    //check linking info
    shaderLinkLog(shaderProgram);

    return shaderProgram;
}

void cleanup() {
    glfwDestroyWindow(glWindow);
    //close GL context and any other GLFW resources
    glfwTerminate();
}

int main(int argc, const char * argv[]) {

    if (!initOpenGLWindow()) {
        glfwTerminate();
        return 1;
    }

    initObjects();
 
    shaderProgram = initBasicShader("shaders/shader.vert", "shaders/shader.frag");
    shaderProgram2 = initBasicShader("shaders/shader.vert", "shaders/shader2.frag");

    currShaderTriangle1 = shaderProgram;
    currShaderTriangle2 = shaderProgram2;

    while (!glfwWindowShouldClose(glWindow)) {
        renderScene();

        glfwPollEvents();
        glfwSwapBuffers(glWindow);
    }

    cleanup();

    return 0;
}
