attribute vec3 a_position;
attribute vec2 a_uv;
attribute vec3 a_normal;

uniform mat4 u_modelMatrix;
uniform mat4 u_mvpMatrix;
uniform vec3 u_cameraPosition;

varying vec2 v_uv;
varying vec3 v_normal;
varying vec3 v_toEye;

void main() {
    gl_Position = u_mvpMatrix * vec4(a_position, 1.0);
    v_uv = a_uv;
    // Convert normal vector to world space (make sure that we don't translate it)
    v_normal = normalize(vec3((u_modelMatrix * vec4(a_normal, 0.0)).xyz));
    // Calculate eye vector
    v_toEye =  normalize(u_cameraPosition - (u_modelMatrix * vec4(a_position, 1.0)).xyz);
}
