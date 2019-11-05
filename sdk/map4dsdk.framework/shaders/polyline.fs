#ifdef GL_ES
precision mediump float;
#endif

uniform vec4 u_color;
uniform float u_textureScale;
uniform bool u_isDotted;
uniform sampler2D u_texture;

varying vec2 v_uv;

void main() {
  vec4 line_color = vec4(0.0);
  if (u_isDotted) {
    vec2 line_st = vec2(v_uv.x * u_textureScale, v_uv.y / 2.0); //check why v_uv.y div 2.0
    line_color = texture2D(u_texture, line_st);
    if (line_color.r > 0.9) {
      discard;
    }
  }
  gl_FragColor = u_color;
}
