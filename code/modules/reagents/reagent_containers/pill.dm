////////////////////////////////////////////////////////////////////////////////
/// Pills.
////////////////////////////////////////////////////////////////////////////////
/obj/item/weapon/reagent_containers/pill
	name = "pill"
	desc = "A pill."
	icon = 'icons/obj/chemical.dmi'
	icon_state = null
	item_state = "pill"
	randpixel = 7
	possible_transfer_amounts = null
	w_class = ITEM_SIZE_TINY
	slot_flags = null
	volume = 60

	New()
		..()
		if(!icon_state)
			icon_state = "pill[rand(1, 20)]"

	attack(mob/M as mob, mob/user as mob, def_zone)
		//TODO: replace with standard_feed_mob() call.

		if(M == user)
			if(!M.can_eat(src))
				return

			to_chat(M, "<span class='notice'>You swallow \the [src].</span>")
			M.drop_from_inventory(src) //icon update
			if(reagents.total_volume)
				reagents.trans_to_mob(M, reagents.total_volume, CHEM_INGEST)
			qdel(src)
			return 1

		else if(istype(M, /mob/living/carbon/human))
			if(!M.can_force_feed(user, src))
				return

			user.visible_message("<span class='warning'>[user] attempts to force [M] to swallow \the [src].</span>")

			user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
			if(!do_mob(user, M))
				return

			user.drop_from_inventory(src) //icon update
			user.visible_message("<span class='warning'>[user] forces [M] to swallow \the [src].</span>")

			var/contained = reagentlist()
			admin_attack_log(user, M, "Fed the victim with [name] (Reagents: [contained])", "Was fed [src] (Reagents: [contained])", "used [src] (Reagents: [contained]) to feed")

			if(reagents.total_volume)
				reagents.trans_to_mob(M, reagents.total_volume, CHEM_INGEST)
			qdel(src)

			return 1

		return 0

	afterattack(obj/target, mob/user, proximity)
		if(!proximity) return

		if(target.is_open_container() && target.reagents)
			if(!target.reagents.total_volume)
				to_chat(user, "<span class='notice'>[target] is empty. Can't dissolve \the [src].</span>")
				return
			to_chat(user, "<span class='notice'>You dissolve \the [src] in [target].</span>")

			admin_attacker_log(user, "spiked \a [target] with a pill. Reagents: [reagentlist()]")
			reagents.trans_to(target, reagents.total_volume)
			for(var/mob/O in viewers(2, user))
				O.show_message("<span class='warning'>[user] puts something in \the [target].</span>", 1)

			qdel(src)

		return

////////////////////////////////////////////////////////////////////////////////
/// Pills. END
////////////////////////////////////////////////////////////////////////////////

//Pills
/obj/item/weapon/reagent_containers/pill/antitox
	name = "Anti-toxins pill"
	desc = "Neutralizes many common toxins."
	icon_state = "pill17"
	New()
		..()
		reagents.add_reagent(/datum/reagent/dylovene, 25)

/obj/item/weapon/reagent_containers/pill/tox
	name = "Toxins pill"
	desc = "Highly toxic."
	icon_state = "pill5"
	New()
		..()
		reagents.add_reagent(/datum/reagent/toxin, 50)

/obj/item/weapon/reagent_containers/pill/cyanide
	name = "Cyanide pill"
	desc = "Don't swallow this."
	icon_state = "pill5"
	New()
		..()
		reagents.add_reagent(/datum/reagent/toxin/cyanide, 50)

/obj/item/weapon/reagent_containers/pill/adminordrazine
	name = "Adminordrazine pill"
	desc = "It's magic. We don't have to explain it."
	icon_state = "pill16"
	New()
		..()
		reagents.add_reagent(/datum/reagent/adminordrazine, 50)

/obj/item/weapon/reagent_containers/pill/stox
	name = "Sleeping pill"
	desc = "Commonly used to treat insomnia."
	icon_state = "pill8"
	New()
		..()
		reagents.add_reagent(/datum/reagent/soporific, 15)

/obj/item/weapon/reagent_containers/pill/kelotane
	name = "Kelotane pill"
	desc = "Used to treat burns."
	icon_state = "pill11"
	New()
		..()
		reagents.add_reagent(/datum/reagent/kelotane, 15)

/obj/item/weapon/reagent_containers/pill/paracetamol
	name = "Paracetamol pill"
	desc = "Weak painkiller with a very slow metabolization speed. Meant for trivial injuries."
	icon_state = "pill8"
	New()
		..()
		reagents.add_reagent(/datum/reagent/paracetamol, 10)

/obj/item/weapon/reagent_containers/pill/tramadol
	name = "Tramadol pill"
	desc = "A simple painkiller."
	icon_state = "pill8"
	New()
		..()
		reagents.add_reagent(/datum/reagent/tramadol, 15)

/obj/item/weapon/reagent_containers/pill/inaprovaline
	name = "Inaprovaline pill"
	desc = "Used to stabilize patients."
	icon_state = "pill20"
	New()
		..()
		reagents.add_reagent(/datum/reagent/inaprovaline, 30)

/obj/item/weapon/reagent_containers/pill/dexalin
	name = "Dexalin pill"
	desc = "Used to treat oxygen deprivation."
	icon_state = "pill16"
	New()
		..()
		reagents.add_reagent(/datum/reagent/dexalin, 15)

/obj/item/weapon/reagent_containers/pill/dexalin_plus
	name = "Dexalin Plus pill"
	desc = "Used to treat extreme oxygen deprivation."
	icon_state = "pill8"
	New()
		..()
		reagents.add_reagent(/datum/reagent/dexalinp, 15)

/obj/item/weapon/reagent_containers/pill/dermaline
	name = "Dermaline pill"
	desc = "Used to treat burn wounds."
	icon_state = "pill12"
	New()
		..()
		reagents.add_reagent(/datum/reagent/dermaline, 15)

/obj/item/weapon/reagent_containers/pill/dylovene
	name = "Dylovene pill"
	desc = "A broad-spectrum anti-toxin."
	icon_state = "pill13"
	New()
		..()
		reagents.add_reagent(/datum/reagent/dylovene, 15)

/obj/item/weapon/reagent_containers/pill/inaprovaline
	name = "Inaprovaline pill"
	desc = "Used to stabilize patients."
	icon_state = "pill20"
	New()
		..()
		reagents.add_reagent(/datum/reagent/inaprovaline, 30)

/obj/item/weapon/reagent_containers/pill/bicaridine
	name = "Bicaridine pill"
	desc = "Used to treat physical injuries."
	icon_state = "pill18"
	New()
		..()
		reagents.add_reagent(/datum/reagent/bicaridine, 20)

/obj/item/weapon/reagent_containers/pill/happy
	name = "Happy pill"
	desc = "Happy happy joy joy!"
	icon_state = "pill18"
	New()
		..()
		reagents.add_reagent(/datum/reagent/space_drugs, 15)
		reagents.add_reagent(/datum/reagent/sugar, 15)

/obj/item/weapon/reagent_containers/pill/zoom
	name = "Zoom pill"
	desc = "Zoooom!"
	icon_state = "pill18"
	New()
		..()
		reagents.add_reagent(/datum/reagent/impedrezene, 10)
		reagents.add_reagent(/datum/reagent/synaptizine, 5)
		reagents.add_reagent(/datum/reagent/hyperzine, 5)

/obj/item/weapon/reagent_containers/pill/doxicycline
	name = "doxicycline pill"
	desc = "Contains antiviral agents."
	icon_state = "pill19"
	New()
		..()
		reagents.add_reagent(/datum/reagent/doxicycline, 15)

/obj/item/weapon/reagent_containers/pill/tetracetam
	name = "tetracetam pill"
	desc = "Contains tetracetam."
	icon_state = "pill9"
	New()
		..()
		reagents.add_reagent(/datum/reagent/tetracetam, 15)

/obj/item/weapon/reagent_containers/pill/oxaprofen
	name = "oxaprofen pill"
	desc = "Contains oxaprofen."
	icon_state = "pill9"
	New()
		..()
		reagents.add_reagent(/datum/reagent/oxaprofen, 15)

/obj/item/weapon/reagent_containers/pill/diet
	name = "diet pill"
	desc = "Guaranteed to get you slim!"
	icon_state = "pill9"
	New()
		..()
		reagents.add_reagent(/datum/reagent/lipozine, 2)

/obj/item/weapon/reagent_containers/pill/noexcutite
	name = "Noexcutite pill"
	desc = "Feeling jittery? This should calm you down."
	icon_state = "pill9"

obj/item/weapon/reagent_containers/pill/noexcutite/New()
		..()
		reagents.add_reagent(/datum/reagent/noexcutite, 15)

//Baycode specific Psychiatry pills.
/obj/item/weapon/reagent_containers/pill/methylphenidate
	name = "Methylphenidate pill"
	desc = "Improves the ability to concentrate."
	icon_state = "pill8"

/obj/item/weapon/reagent_containers/pill/methylphenidate/New()
		..()
		reagents.add_reagent(/datum/reagent/methylphenidate, 15)

/obj/item/weapon/reagent_containers/pill/citalopram
	name = "Citalopram pill"
	desc = "Mild anti-depressant."
	icon_state = "pill8"

/obj/item/weapon/reagent_containers/pill/citalopram/New()
		..()
		reagents.add_reagent(/datum/reagent/citalopram, 15)

/obj/item/weapon/reagent_containers/pill/paroxetine
	name = "Paroxetine pill"
	desc = "Before you swallow a bullet: try swallowing this!"
	icon_state = "pill20"

/obj/item/weapon/reagent_containers/pill/paroxetine/New()
		..()
		reagents.add_reagent(/datum/reagent/paroxetine, 10)

/obj/item/weapon/reagent_containers/pill/antidexafen
	name = "cold medicine pill"
	desc = "Safe for babies!"
	icon_state = "pill20"

/obj/item/weapon/reagent_containers/pill/antidexafen/New()
		..()
		reagents.add_reagent(/datum/reagent/antidexafen, 10)
		reagents.add_reagent(/datum/reagent/drink/juice/lemon, 5)
		reagents.add_reagent(/datum/reagent/menthol, REM*0.2)


//coldwar pills

/obj/item/weapon/reagent_containers/pill/amidopyrinum
	name = "amidopyrinum pill"
	desc = "A very strong painkiller, intended for use with patients that are in shock. - WARNING! Do not administer if the patient is not breathing."
	icon_state = "pill21"
	New()
		..()
		reagents.add_reagent(/datum/reagent/amidopyrinum, 5)

/obj/item/weapon/reagent_containers/pill/doxycicline
	name = "doxycicline pill"
	desc = "A broad spectrum antibiotic to fight against infections."
	icon_state = "pill21"
	New()
		..()
		reagents.add_reagent(/datum/reagent/doxicycline, 5)


/obj/item/weapon/reagent_containers/pill/phenazepam
	name = "phenazepam pill"
	desc = "A mild painkiller with a slow metabolization speed. Meant for mild injuries."
	icon_state = "pill21"
	New()
		..()
		reagents.add_reagent(/datum/reagent/phenazepam, 5)

/* /obj/item/weapon/reagent_containers/pill/sydnocarbum
	name = "sydnocarbum pill"
	desc = "That's a pill."
	icon_state = "pill21"
	New()
		..()
		reagents.add_reagent(/datum/reagent/water, 5) /*lovushka jokera*/ */

/obj/item/weapon/reagent_containers/pill/naloxone
	name = "Naloxone pill"
	desc = "That's a pill."
	icon_state = "pill21"
	New()
		..()
		reagents.add_reagent(/datum/reagent/naloxone, 5)

/obj/item/weapon/reagent_containers/pill/promethazine
	name = "promethazine pill"
	desc = "Mild sedative for injured patients that require resting. Provides long-lasting pain relief and strong drowsiness."
	icon_state = "pill21"
	New()
		..()
		reagents.add_reagent(/datum/reagent/promethazine, 5)

/obj/item/weapon/reagent_containers/pill/ethaperazine
	name = "ethaperazine pill"
	desc = "A mild neuroleptic and anti-emetic. Provides relief from nausea and vomiting."
	icon_state = "pill21"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethaperazine, 5)

/obj/item/weapon/reagent_containers/pill/angiotensin
	name = "Angiotensin pill"
	desc = "An effective compound which helps restore bloodflow to the brain and organs, useful for toxin and brain damage."
	icon_state = "pill11"
	New()
		..()
		reagents.add_reagent(/datum/reagent/angiotensin, 15)