attribute vec2 a_position;
attribute vec2 a_extrude;
attribute vec2 a_uv;

uniform float u_lineWidth;
uniform mat4 u_mvpMatrix;

varying vec2 v_uv;

void main() {
    vec2 delta = (u_lineWidth / 2.0) * a_extrude;
    v_uv = a_uv;
    gl_Position = u_mvpMatrix * vec4(a_position + delta, 0.0, 1.0);
}
