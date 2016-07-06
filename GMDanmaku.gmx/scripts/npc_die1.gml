///npc_die1(colour)
if x<-50 || x>475 || y<-50 || y>530 {}else{

part_particles_create_colour(global.Psys, x, y, global.part_npc_die1, argument0, 1);
part_particles_create_colour(global.Psys, x, y, global.part_npc_die2, argument0, 1);

}