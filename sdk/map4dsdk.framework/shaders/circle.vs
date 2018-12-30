attribute vec2 a_extrude;

uniform float u_radius;
uniform mat4 u_mvpMatrix;

void main() {
  gl_Position = u_mvpMatrix * vec4(u_radius * a_extrude, 0.0, 1.0);
}
