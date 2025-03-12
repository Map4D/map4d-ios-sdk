#ifdef GL_ES
precision mediump float;
#endif

uniform vec4 u_color;
uniform float u_textureScale;
uniform bool u_useStrokePattern;
uniform bool u_useIcon;
uniform sampler2D u_texture;

varying vec2 v_uv;

void main() {
  if (u_useStrokePattern) {
    vec2 line_st = vec2(v_uv.x * u_textureScale, v_uv.y);
    vec4 line_color = texture2D(u_texture, line_st);
    if (u_useIcon) {
      gl_FragColor = line_color;
    }
    else {
      gl_FragColor = vec4(u_color.rgb, line_color.a * u_color.a);
    }
  }
  else {
    gl_FragColor = u_color;
  }
}
