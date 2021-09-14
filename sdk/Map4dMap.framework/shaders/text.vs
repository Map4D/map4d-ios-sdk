attribute vec2 a_position;
attribute vec2 a_uv;

uniform mat4 u_mvpMatrix;
uniform float u_size;
uniform vec4 u_color;
uniform mediump int u_halo;
uniform vec4 u_haloColor;
uniform float u_max_stroke_width;
uniform float u_scale;

varying vec2 v_uv;
varying float v_sdf_threshold;
varying float v_sdf_pixel;
varying vec4 v_color;
varying float v_alpha;

void main() {
  v_color = u_color;
  v_alpha = u_color.a;

  float sdf_scale = u_scale / 64.0;
  v_sdf_pixel = 0.5 / (u_max_stroke_width * sdf_scale);
  
  if (u_halo == 0) {
    v_sdf_threshold = 0.5;
  }
  else {
    if (u_haloColor.a > 0.0) {
      float stroke_width;
      stroke_width = ((u_haloColor.a * u_max_stroke_width) * (0.5 / u_max_stroke_width));
      stroke_width = (stroke_width / sdf_scale);
      v_sdf_threshold = max ((0.5 - stroke_width), 0.0);
      v_color.xyz = u_haloColor.xyz;
    } else {
      v_alpha = 0.0;
    }
  }

  gl_Position = u_mvpMatrix * vec4(a_position / 4.0, 0.0, 1.0);
  v_uv = a_uv / u_size;
}
