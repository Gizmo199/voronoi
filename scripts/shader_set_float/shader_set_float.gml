function shader_set_float(name, value){
	var uni = shader_get_uniform(shader_current(), name);
	shader_set_uniform_f_array(uni, is_array(value) ? value : [value]);
}
