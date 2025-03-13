#ifdef GL_ES
precision mediump float;
#endif

uniform sampler2D u_texture;
uniform vec4 u_color;
uniform vec4 u_spriteInfo;
uniform vec3 u_padding;
uniform int u_useMaskTexture;
uniform float u_fade;

varying vec2 v_uv;

void main() {
  if (u_useMaskTexture > 0) {
    float spriteWidth = u_spriteInfo.x;
    float spriteHeight = u_spriteInfo.y;
    float col = u_spriteInfo.z;
    float row = u_spriteInfo.w;

    vec2 mask_uv = vec2(spriteWidth * v_uv.x, spriteHeight * (v_uv.y));
    vec4 mask = texture2D(u_texture, mask_uv);

    if (u_useMaskTexture == 1) {
      vec2 icon_uv = vec2(spriteWidth * (col + v_uv.x) + u_padding.x * col, spriteHeight * (row + v_uv.y) + u_padding.y * row);
      vec4 icon = texture2D(u_texture, icon_uv);

      // gl_FragColor = vec4(mix(u_color.xyz, icon.xyz, icon.a), mask.g);
      // gl_FragColor = u_color * mask.r + icon * icon.a;
      gl_FragColor = vec4(mix(u_color.xyz * mask.r, icon.xyz, icon.a), mask.r);
    }
    else {
      gl_FragColor = u_color * mask.r;
    }
  }
  else {
    gl_FragColor = texture2D(u_texture, v_uv);
  }
  
  gl_FragColor.a *= u_fade;
}
