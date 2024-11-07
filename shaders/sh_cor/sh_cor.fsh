//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float valor;

void main()
{

	vec4 base = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	vec3 val = vec3(0.2126, 0.7152, 0.0722);
	vec3 nova = vec3(base.rgb);
	float fim = dot(nova, val);
	
	nova.r = mix(nova.r, fim, valor);
	nova.g = mix(nova.g, fim, valor);
	nova.b = mix(nova.b, fim, valor);
	
    gl_FragColor = vec4(nova.r, nova.g, nova.b, base.a);
}
