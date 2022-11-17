//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float amount;

void main() {
vec4 base_colour = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor = vec4( mix( base_colour.rgb, vec3(1.0), amount ), base_colour.a );
}
