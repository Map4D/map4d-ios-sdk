#ifdef GL_ES
precision mediump float;
#endif

uniform sampler2D u_texture;
uniform vec3 u_light_position;
uniform vec3 u_light_color;
uniform float u_fogStart;
uniform float u_fogRange;
uniform vec3 u_fogColor;

varying vec3 v_position;
varying vec2 v_uv;
varying vec3 v_normal;


void main() {
    // initialize
    vec3 diffuse = vec3(1.0, 1.0, 1.0);

    vec3 normal = normalize(v_normal);
    vec4 materialColor = texture2D(u_texture, v_uv);
    vec3 light = normalize(u_light_position);

    // diffuse
    float diffuseCoefficient = max(0.0, dot(normal, light));
    diffuse = diffuseCoefficient * materialColor.rgb * u_light_color;
    vec4 vertexColor = vec4(mix(materialColor.rgb, diffuseCoefficient * diffuse, 0.2), materialColor.a);

	float dist = distance(v_position, vec3(0.0));
    // fog
    float visibility = (dist - u_fogStart) / u_fogRange;
    visibility = clamp(visibility, 0.0, 1.0);
    gl_FragColor = vec4(mix(vertexColor.rgb, u_fogColor, visibility), vertexColor.a);
	
	if (gl_FragColor.a < 0.3 || visibility >= 0.5) {
      discard;
    }
}
