// "Floating ghost blade" effect for blade heretics
/obj/effect/floating_blade
	name = "knife"
	icon = 'icons/obj/service/kitchen.dmi'
	icon_state = "knife"
	plane = GAME_PLANE_FOV_HIDDEN
	/// The color the knife glows around it.
	var/glow_color = "#ececff"

/obj/effect/floating_blade/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/movetype_handler)
	ADD_TRAIT(src, TRAIT_MOVE_FLYING, INNATE_TRAIT)
	add_filter("dio_knife", 2, list("type" = "outline", "color" = glow_color, "size" = 1))

/obj/effect/floating_blade/haunted
	icon = 'icons/obj/weapons/khopesh.dmi'
	icon_state = "render"
