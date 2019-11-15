#ifdef GL_ES
precision mediump float;
#endif

uniform sampler2D u_texture;
uniform vec4 u_color;

varying vec2 v_uv;
const float width = 0.28;
const float edge = 0.3;
const vec3 outlineColor = vec3(1.0, 1.0, 1.0);

void main(void) {
  float signed_distance = texture2D(u_texture, v_uv).a;
  float signed_distance_1_over_2 = 1.0 / (2.0 * signed_distance);
  float smooth_signed_distance = pow(signed_distance, signed_distance_1_over_2);
  float alpha = smoothstep(width, width + edge, smooth_signed_distance);
  vec3 overallColor = mix(outlineColor, u_color.rgb, alpha);
  gl_FragColor = vec4(overallColor, 1.0) * alpha;

}
