/datum/quirk/item_quirk/signer
	name = "Signer"
	desc = "You possess excellent communication skills in sign language."
	icon = FA_ICON_HANDS
	value = 3
	quirk_flags = QUIRK_HUMAN_ONLY
	medical_record_text = "Patient can communicate with sign language."
	mail_goodies = list(/obj/item/clothing/gloves/radio)

/datum/quirk/item_quirk/signer/add(client/client_source)
	quirk_holder.AddComponent(/datum/component/sign_language)

/datum/quirk/item_quirk/signer/remove()
	qdel(quirk_holder.GetComponent(/datum/component/sign_language))
