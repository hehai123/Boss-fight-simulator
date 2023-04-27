if (instance_exists(monster_id)) {
	x = monster_id.x + x_hit_location;
}

if animation_end()
{
	instance_destroy();
}

