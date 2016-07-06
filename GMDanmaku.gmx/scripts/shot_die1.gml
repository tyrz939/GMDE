///shot_die1(colour)

part_type_speed(global.part_shot_die,spd,spd,0,0);
part_type_direction(global.part_shot_die,direction,direction,0,0);
part_particles_create_colour(global.Psys, x, y, global.part_shot_die,argument0, 1);