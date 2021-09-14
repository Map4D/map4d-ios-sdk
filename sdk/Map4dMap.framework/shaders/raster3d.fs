#ifdef GL_ES
precision highp float;
#endif

uniform float u_fogStart;
uniform float u_fogRange;
uniform vec3 u_fogColor;
uniform float u_time;   
uniform int u_enableWater;

uniform sampler2D u_texture;
uniform sampler2D u_waterDisplacement;
uniform sampler2D u_waterColor;

uniform float u_fade;

varying vec2 v_uv;

vec4 calculateWaterColor(vec4 tileColor, sampler2D waterDispl, sampler2D waterColor, vec2 uv, float time) {
	float eps = 0.01;
	if (abs(tileColor.x - 0.639) < eps && abs(tileColor.y - 0.8) < eps && abs(tileColor.z - 1.0) < eps) {
		vec2 displacement = texture2D( waterDispl, 4.0 * vec2(uv.x, uv.y + time )).rg;
		vec2 offset = (displacement * 2.0 - 1.0) * 0.2;
		vec4 color = texture2D(waterColor, uv * 2.0 + offset);
		color.a *= u_fade;
		return color;
	} else {
		return tileColor;
	} 
}

void main() {
    vec4 tileColor = texture2D(u_texture, v_uv);
	tileColor.a *= u_fade;
	vec4 vertexColor = u_enableWater == 0 ? tileColor : calculateWaterColor(tileColor, u_waterDisplacement, u_waterColor, v_uv, u_time);
    // fog
    float dist = (gl_FragCoord.z / gl_FragCoord.w);
    float visibility = (dist - u_fogStart) / u_fogRange;
    visibility = clamp(visibility, 0.0, 1.0);
    gl_FragColor = vec4(mix(vertexColor.rgb, u_fogColor, visibility), vertexColor.a);
}
