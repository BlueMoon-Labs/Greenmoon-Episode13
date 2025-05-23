/obj/effect/projectile
	name = "pew"
	icon = 'icons/obj/weapons/guns/projectiles.dmi'
	icon_state = "nothing"
	layer = HITSCAN_PROJECTILE_LAYER
	plane = GAME_PLANE_FOV_HIDDEN
	anchored = TRUE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	appearance_flags = LONG_GLIDE

/obj/effect/projectile/singularity_pull(atom/singularity, current_size)
	return

/obj/effect/projectile/singularity_act()
	return

/obj/effect/projectile/proc/scale_to(nx,ny,override=TRUE)
	var/matrix/M
	if(!override)
		M = transform
	else
		M = new
	M.Scale(nx,ny)
	transform = M

/obj/effect/projectile/proc/turn_to(angle,override=TRUE)
	var/matrix/M
	if(!override)
		M = transform
	else
		M = new
	M.Turn(angle)
	transform = M

/obj/effect/projectile/New(angle_override, p_x, p_y, color_override, scaling = 1)
	if(angle_override && p_x && p_y && color_override && scaling)
		apply_vars(angle_override, p_x, p_y, color_override, scaling)
	return ..()

/obj/effect/projectile/proc/apply_vars(angle_override, p_x = 0, p_y = 0, color_override, scaling = 1, increment = 0)
	pixel_x = p_x
	pixel_y = p_y
	if(color_override)
		color = color_override
	scale_to(1, scaling, FALSE)
	turn_to(angle_override, FALSE)
	for(var/i in 1 to increment)
		pixel_x += round((sin(angle_override)+16*sin(angle_override)*2), 1)
		pixel_y += round((cos(angle_override)+16*cos(angle_override)*2), 1)

/obj/effect/abstract/projectile_lighting

/obj/effect/abstract/projectile_lighting/Initialize(mapload, color, range, intensity)
	. = ..()
	set_light(range, intensity, color)
