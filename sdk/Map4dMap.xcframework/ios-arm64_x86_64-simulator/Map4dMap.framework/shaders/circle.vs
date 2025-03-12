#ifdef GL_ES
precision highp float;
#endif
  
attribute vec2 a_extrude;

uniform float u_radius;
uniform mat4 u_mvpMatrix;

varying vec2 v_extrude;

void main() {
  vec2 circleExtrude = u_radius * a_extrude;
  gl_Position = u_mvpMatrix * vec4(circleExtrude, 0.0, 1.0);
  v_extrude = circleExtrude;
}
