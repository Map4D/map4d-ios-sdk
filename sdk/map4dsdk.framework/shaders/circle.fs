#ifdef GL_ES
precision highp float;
#endif

uniform vec4 u_color;
uniform vec4 u_strokeColor;
uniform float u_outerRadius;
uniform float u_innerRadius;

varying vec2 v_extrude;

void main() {
  float dist = length(v_extrude);
  if (dist - u_outerRadius > 0.0) {
    discard;
  }
  else {
    if (dist - u_innerRadius > 0.0) {
      gl_FragColor = u_strokeColor;
    }
    else {
      gl_FragColor = u_color;
    }
  }
}
