varying vec2	v_vTexcoord;
varying vec4	v_vColour;

uniform float	time;
uniform float	size;
uniform vec3	color1;
uniform vec3	color2;

vec2 hash2(vec2 v){
    return normalize(fract(cos(v*mat2(94.55,-69.38,-89.27,78.69))*825.79)-.5);    
}
void main()
{
	vec2 uv = v_vTexcoord * size;	
	vec2 i_uv = floor(uv);
	vec2 f_uv = fract(uv);
	float m_dist = 8.;
	
	for ( float i=-1.; i<=1.; i++ )
	for ( float j=-1.; j<=1.; j++ ){
	
		vec2 neighbor = vec2(i, j);
		vec2 point = .5 + .5 * sin(time+6.2831*hash2(i_uv + neighbor));			
		m_dist = min(m_dist, length(neighbor + point - f_uv));
		
	}
	
	vec3 final_color = mix(color1/255., color2/255., m_dist);
    gl_FragColor = vec4(final_color, 1.);
}
