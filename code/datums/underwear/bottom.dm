/datum/category_item/underwear/bottom
	underwear_gender = PLURAL
	underwear_name = "underwear"
	underwear_type = /obj/item/underwear/bottom

/*
/datum/category_item/underwear/bottom/none
	name = "None"
	always_last = TRUE
	underwear_type = null
*/

/datum/category_item/underwear/bottom/briefs
	name = "Briefs"
	underwear_name = "briefs"
	icon_state = "briefs"
	has_color = TRUE

/datum/category_item/underwear/bottom/briefs/is_default(var/gender)
	return gender != FEMALE
/*
/datum/category_item/underwear/bottom/panties_noback
	name = "Panties, noback"
	underwear_name = "panties"
	icon_state = "panties_noback"
	has_color = TRUE
*/
/datum/category_item/underwear/bottom/boxers_loveheart
	name = "Boxers, Loveheart"
	underwear_name = "boxers"
	icon_state = "boxers_loveheart"

/datum/category_item/underwear/bottom/boxers
	is_default = TRUE
	name = "Boxers"
	underwear_name = "boxers"
	icon_state = "boxers"
	has_color = TRUE

/datum/category_item/underwear/bottom/boxers_green_and_blue
	name = "Boxers, green & blue striped"
	underwear_name = "boxers"
	icon_state = "boxers_green_and_blue"
/*
/datum/category_item/underwear/bottom/panties
	name = "Panties"
	underwear_name = "panties"
	icon_state = "panties"
	has_color = TRUE

/datum/category_item/underwear/bottom/panties/is_default(var/gender)
	return gender == FEMALE

/datum/category_item/underwear/bottom/lacy_thong
	name = "Lacy thong"
	underwear_name = "thong"
	icon_state = "lacy_thong"

/datum/category_item/underwear/bottom/lacy_thong_alt
	name = "Lacy thong, alt"
	underwear_name = "thong"
	icon_state = "lacy_thong_alt"
	has_color = TRUE

/datum/category_item/underwear/bottom/panties_alt
	name = "Panties, alt"
	underwear_name = "panties"
	icon_state = "panties_alt"
	has_color = TRUE

/datum/category_item/underwear/bottom/compression_shorts
	name = "Compression shorts"
	icon_state = "compression_shorts"
	has_color = TRUE

/datum/category_item/underwear/bottom/thong
	name = "Thong"
	underwear_name = "thong"
	icon_state = "thong"
	has_color = TRUE
*/
/datum/category_item/underwear/bottom/expedition_pt_shorts
	name = "PT shorts, 1"
	icon_state = "expedition_shorts"

/datum/category_item/underwear/bottom/fleet_pt_shorts
	name = "PT shorts, 2"
	icon_state = "fleet_shorts"

/datum/category_item/underwear/bottom/marine_pt_shorts
	name = "PT shorts, 3"
	icon_state = "marine_shorts"

/datum/category_item/underwear/bottom/longjon
	name = "Long John Bottoms"
	underwear_name = "long johns"
	icon_state = "ljonb"
	has_color = TRUE
