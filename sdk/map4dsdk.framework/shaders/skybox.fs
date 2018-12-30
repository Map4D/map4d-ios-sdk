#ifdef GL_ES
precision mediump float;
#endif

uniform samplerCube u_cube;
uniform float u_lowerLimit;
uniform float u_upperLimit;

varying vec3 v_position;
varying float v_y;

vec4 fogColor = vec4(1.0);

void main() {
  vec4 vertexColor = textureCube(u_cube, v_position);
  float factor = (v_y - u_lowerLimit) / (u_upperLimit - u_lowerLimit);
  factor = clamp(factor, 0.0, 1.0);
  gl_FragColor = mix(fogColor, vertexColor, factor);
}
