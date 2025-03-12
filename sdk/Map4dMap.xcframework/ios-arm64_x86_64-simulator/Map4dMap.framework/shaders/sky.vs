
#ifdef GL_ES
precision highp float;
#endif

attribute vec3 a_position;

uniform mat4 u_mvpMatrix;

varying vec3 v_position;

void main() {
  gl_Position = u_mvpMatrix * vec4(a_position, 1.0);
  gl_Position.z =  gl_Position.w - 0.000001;
  v_position = gl_Position.xyz;
}
