
#ifdef GL_ES
precision mediump float;
#endif

attribute vec3 a_position;

uniform mat4 u_mvpMatrix;

void main() {
  gl_Position = u_mvpMatrix * vec4(a_position, 1.0);
}
