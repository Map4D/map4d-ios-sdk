#ifdef GL_ES
precision highp float;
#endif

uniform float u_lowerLimit;
uniform float u_upperLimit;

uniform vec3 u_skyColor;
uniform vec3 u_fogColor;

varying vec3 v_position;

void main() {
  float factor = (v_position.y - u_lowerLimit) / (u_upperLimit - u_lowerLimit);
  factor = clamp(factor, 0.05, 1.0);
  if (v_position.y > u_lowerLimit) {
	gl_FragColor = vec4(mix(u_fogColor.rgb, u_skyColor.rgb, factor), 1.0);
  } else {
	discard;
  }

}
