/*
    Generates the global particle types for the particle system!
*/

// Start
part_system_clear(global.Psysm);
global.Psys = part_system_create(); // Particle System
part_system_automatic_draw(global.Psys,false);

// Spawn shot
global.part_shot_spawn = part_type_create();
part_type_shape(global.part_shot_spawn,pt_shape_sphere);
part_type_size(global.part_shot_spawn,0.5,0.5,-0.025,0);
part_type_scale(global.part_shot_spawn,1,1);
part_type_alpha3(global.part_shot_spawn,1,1,0);
part_type_speed(global.part_shot_spawn,0,0,0,0);
part_type_direction(global.part_shot_spawn,0,0,0,0);
part_type_orientation(global.part_shot_spawn,0,0,0,0,1);
part_type_blend(global.part_shot_spawn,false);
part_type_life(global.part_shot_spawn,15,15);

// Shot die
global.part_shot_die = part_type_create();
part_type_shape(global.part_shot_die,pt_shape_ring);
part_type_size(global.part_shot_die,0.2,0.2,0.04,0);
part_type_scale(global.part_shot_die,0.5,0.5);
part_type_alpha3(global.part_shot_die,1, 1, 0);
part_type_speed(global.part_shot_die,0,0,0,0);
part_type_direction(global.part_shot_die,0,0,0,0);
part_type_orientation(global.part_shot_die,0,359,0,0,1);
part_type_blend(global.part_shot_die,false);
part_type_life(global.part_shot_die,40,40);

// NPC die
global.part_npc_die1 = part_type_create();
part_type_sprite(global.part_npc_die1,spr_death_oval,false,false,false);
part_type_size(global.part_npc_die1,0.5,0.5,0.05,0);
part_type_scale(global.part_npc_die1,1,1);
part_type_alpha2(global.part_npc_die1,0.75,0);
part_type_speed(global.part_npc_die1,0,0,0,0);
part_type_direction(global.part_npc_die1,0,359,0,0);
part_type_orientation(global.part_npc_die1,0,359,0,0,1);
part_type_blend(global.part_npc_die1,false);
part_type_life(global.part_npc_die1,20,20);

global.part_npc_die2 = part_type_create();
part_type_sprite(global.part_npc_die2,spr_death,true,true,false);
part_type_size(global.part_npc_die2,1,1,0,0);
part_type_scale(global.part_npc_die2,2,2);
part_type_alpha1(global.part_npc_die2,1);
part_type_speed(global.part_npc_die2,0,0,0,0);
part_type_direction(global.part_npc_die2,0,359,0,0);
part_type_orientation(global.part_npc_die2,0,359,0,0,1);
part_type_blend(global.part_npc_die2,true);
part_type_life(global.part_npc_die2,20,20);

// Kaede impact
global.part_mimpact = part_type_create();
part_type_shape(global.part_mimpact,pt_shape_star);
part_type_size(global.part_mimpact,1,1,-0.05,0);
part_type_scale(global.part_mimpact,0.75,0.75);
part_type_alpha1(global.part_mimpact,1);
part_type_speed(global.part_mimpact,4,4,0,0);
part_type_direction(global.part_mimpact,0,359,0,0);
part_type_orientation(global.part_mimpact,0,359,15,0,1);
part_type_blend(global.part_mimpact,false);
part_type_life(global.part_mimpact,20,20);

// Kaede Laser Beam
global.part_mlaz = part_type_create();
part_type_shape(global.part_mlaz,pt_shape_spark);
part_type_size(global.part_mlaz,1,1,-0.1,0);
part_type_scale(global.part_mlaz,0.5,0.5);
part_type_alpha1(global.part_mlaz,1);
part_type_speed(global.part_mlaz,1,1,0,0);
part_type_direction(global.part_mlaz,0,359,0,0);
part_type_orientation(global.part_mlaz,0,359,15,0,1);
part_type_blend(global.part_mlaz,false);
part_type_life(global.part_mlaz,10,10);

// Kaede Laser Impact
global.part_mlaser = part_type_create();
part_type_shape(global.part_mlaser,pt_shape_spark);
part_type_size(global.part_mlaser,1,1,0,0);
part_type_scale(global.part_mlaser,0.75,0.75);
part_type_alpha3(global.part_mlaser,1,1,0);
part_type_speed(global.part_mlaser,0,0,0,0);
part_type_direction(global.part_mlaser,0,0,0,0);
part_type_orientation(global.part_mlaser,0,359,0,0,1);
part_type_blend(global.part_mlaser,false);
part_type_life(global.part_mlaser,10,10);




/*==========================================
           Not Used Anymore
==========================================*


// Reimu impact
global.part_rimpact = part_type_create();
part_type_shape(global.part_rimpact,pt_shape_sphere);
part_type_size(global.part_rimpact,1,1,0,0);
part_type_scale(global.part_rimpact,1.2,0.25);
part_type_alpha2(global.part_rimpact,1,0);
part_type_speed(global.part_rimpact,4,4,0,0);
part_type_direction(global.part_rimpact,80,100,0,0);
part_type_orientation(global.part_rimpact,0,0,0,0,1);
part_type_blend(global.part_rimpact,true);
part_type_life(global.part_rimpact,15,15);

// Reimu homing impact
global.part_rimpact_h = part_type_create();
part_type_shape(global.part_rimpact_h,pt_shape_square);
part_type_size(global.part_rimpact_h,1,1,0,0);
part_type_scale(global.part_rimpact_h,0.2,0.2);
part_type_alpha2(global.part_rimpact_h,1,0);
part_type_speed(global.part_rimpact_h,4,4,0,0);
part_type_direction(global.part_rimpact_h,0,0,0,0);
part_type_orientation(global.part_rimpact_h,0,0,0,0,1);
part_type_blend(global.part_rimpact_h,true);
part_type_life(global.part_rimpact_h,15,15);

// Reimu needle impact
global.part_rimpact_n = part_type_create();
part_type_shape(global.part_rimpact_n,pt_shape_sphere);
part_type_size(global.part_rimpact_n,1,1,0,0);
part_type_scale(global.part_rimpact_n,1.2,0.25);
part_type_alpha3(global.part_rimpact_n,1,1,0);
part_type_speed(global.part_rimpact_n,4,4,0,0);
part_type_direction(global.part_rimpact_n,75,105,0,0);
part_type_orientation(global.part_rimpact_n,0,0,0,0,1);
part_type_blend(global.part_rimpact_n,true);
part_type_life(global.part_rimpact_n,15,15);

// Player shot impact
global.part_impact = part_type_create();
part_type_shape(global.part_impact,pt_shape_spark);
part_type_size(global.part_impact,1,1,0,0);
part_type_scale(global.part_impact,1,1);
part_type_alpha2(global.part_impact,1,0);
part_type_speed(global.part_impact,0,0,0,0);
part_type_direction(global.part_impact,0,0,0,0);
part_type_orientation(global.part_impact,0,359,0,0,1);
part_type_blend(global.part_impact,true);
part_type_life(global.part_impact,10,10);

// Mima impact
global.part_mimaimpact = part_type_create();
part_type_shape(global.part_mimaimpact,pt_shape_spark);
part_type_size(global.part_mimaimpact,1,1,-0.05,0);
part_type_scale(global.part_mimaimpact,0.75,0.75);
part_type_alpha1(global.part_mimaimpact,1);
part_type_speed(global.part_mimaimpact,4,4,0,0);
part_type_direction(global.part_mimaimpact,0,359,0,0);
part_type_orientation(global.part_mimaimpact,0,359,15,0,1);
part_type_blend(global.part_mimaimpact,true);
part_type_life(global.part_mimaimpact,20,20);