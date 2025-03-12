attribute vec3 a_position;
attribute vec2 a_uv;

uniform mat4 u_mvpMatrix;

varying vec2 v_uv;

void main() {
  gl_Position = u_mvpMatrix * vec4(a_position, 1.0);
  v_uv = a_uv;
}
