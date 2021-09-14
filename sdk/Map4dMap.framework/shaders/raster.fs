#ifdef GL_ES
precision mediump float;
#endif

uniform sampler2D u_texture;
uniform float u_fade;

varying vec2 v_uv;

void main() {
    gl_FragColor = texture2D(u_texture, v_uv);
	gl_FragColor.a *= u_fade;
}
