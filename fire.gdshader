shader_type canvas_item;

uniform float animation_speed = 0.5;
uniform sampler2D noise_texture: hint_default_black, repeat_enable;
uniform vec4 flame_color : source_color = vec4(.4);

void fragment() {
	//making the flame move up wards
	vec2 uv = vec2(UV.x, UV.y + TIME * animation_speed);
	//geting noise texture
	vec4 noise_color = texture(noise_texture, uv);
	//setting color
	vec4 final_color = noise_color;
	final_color.rgb += vec3(UV.y);
	final_color.rgb = step(final_color.rgb, vec3(0.99));
	//inverting the color
	final_color.rgb = vec3(1.0) - final_color.rgb;
	//setting the black color to trasparent
	final_color.a = final_color.r;
	//giving the red color of flame
	final_color.rgb = flame_color.rgb;
	COLOR = final_color;
	// Called for every pixel the material is visible on.
}
