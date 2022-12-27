shader_set(shd_voronoi);
shader_set_float("size", size);
shader_set_float("color1", color1);
shader_set_float("color2", color2);
shader_set_float("time", ++time*move);

	draw_self();

shader_reset();