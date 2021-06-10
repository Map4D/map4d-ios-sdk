#ifdef GL_ES
precision mediump float;
#endif

uniform sampler2D u_texture;
uniform mediump int u_halo;

varying vec2 v_uv;
varying float v_sdf_pixel;
varying float v_sdf_threshold;
varying vec4 v_color;

const float width = 0.28;
const float edge = 0.3;
const vec3 outlineColor = vec3(1.0, 1.0, 1.0);

void main(void) {
  vec4 color = v_color;
  float signed_distance = texture2D(u_texture, v_uv).a;
  float add_smooth = 0.25;
  float filter_width = (v_sdf_pixel * (0.5 + add_smooth));
  float start = max(v_sdf_threshold - filter_width, 0.0);
  float end = v_sdf_threshold + filter_width;
  
  float signed_distance_1_over_2 = 1.0 / (2.0 * signed_distance);
  float smooth_signed_distance = pow(signed_distance, signed_distance_1_over_2);
  float alpha;
  if (u_halo == 0) {
    alpha = smoothstep(width, width + edge, smooth_signed_distance);
  }
  else {
    alpha = smoothstep(start, end, smooth_signed_distance);
  }
  vec3 overallColor = mix(outlineColor, color.rgb, alpha);
  gl_FragColor = vec4(overallColor, 1.0) * alpha;
}
