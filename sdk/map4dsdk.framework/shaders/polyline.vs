attribute vec2 a_position;
attribute vec2 a_extrude;

uniform float u_lineWidth;
uniform mat4 u_mvpMatrix;

void main() {
	vec2 delta = (u_lineWidth / 2.0) * a_extrude;

	gl_Position = u_mvpMatrix * vec4(a_position + delta, 0.0, 1.0);
}
