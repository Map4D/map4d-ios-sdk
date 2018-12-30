#ifdef GL_ES
precision mediump float;
#endif

uniform sampler2D u_texture;
uniform float u_fogStart;
uniform float u_fogRange;

varying vec2 v_uv;

const vec4 fogColor= vec4(1.0);

void main() {
    vec4 vertexColor = texture2D(u_texture, v_uv);
    // fog
    float dist = (gl_FragCoord.z / gl_FragCoord.w);
    float visibility = (dist - u_fogStart) / u_fogRange;
    visibility = clamp(visibility, 0.0, 1.0);
    gl_FragColor = mix(vertexColor, fogColor, visibility);
}
