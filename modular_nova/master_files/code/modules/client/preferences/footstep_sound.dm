/datum/preference/choiced/footstep_sound
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "footstep_sound"

/datum/preference/choiced/footstep_sound/init_possible_values()
	return list("Default", "Shoes", "Claws")

/datum/preference/choiced/footstep_sound/create_default_value()
	return "Default"

/datum/preference/choiced/footstep_sound/apply_to_human(mob/living/carbon/human/target, value)
	if(value == "Default")
		return

	var/list/value_to_define = list(
		"Shoes" = FOOTSTEP_MOB_SHOE,
		"Claws" = FOOTSTEP_MOB_CLAW,
	)
	var/obj/item/bodypart/leg/left_leg = target.get_bodypart(BODY_ZONE_L_LEG)
	var/obj/item/bodypart/leg/right_leg = target.get_bodypart(BODY_ZONE_R_LEG)
	var/footstep_type = value_to_define[value]
	left_leg.footstep_type = footstep_type
	right_leg.footstep_type = footstep_type
