attribute vec2 a_position;
attribute vec2 a_texCoord;

uniform mat4 u_mvpMatrix;
uniform float u_size;

varying vec2 v_uv;

void main() {
  gl_Position =  u_mvpMatrix * vec4(a_position / 4.0, 0.0, 1.0);
  v_uv = a_texCoord / u_size;
}