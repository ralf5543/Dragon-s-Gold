// Script assets have changed for v2.3.0 see

function PlayerState_Attack_Slash(){
	hsp = 0;
	vsp = 0;

	// Start of the attack
	if (sprite_index != asset_get_index("spr_" + character + "_attack_strip7")) {
		sprite_index = asset_get_index("spr_" + character + "_attack_strip7");
		image_index = 0;
		ds_list_clear(hitByAttack);
	}
	
	//use attack hitbox and checks for hits
	mask_index = asset_get_index("spr_" + character + "_attackHB_strip7");//use the attack ùask collision
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x, y, obj_player, hitByAttackNow, false);
	
	// if we hit something
	if (hits > 0) {
		for (var i = 0; i < hits; i ++) {
			
		    // if this instance has not yet been hit by this attack
			var hitID = ds_list_find_value(hitByAttackNow, i);
			if (ds_list_find_index(hitByAttack, hitID) == -1) {
				ds_list_add(hitByAttack, hitID);
				
				with (hitID) {
					// anything happening to the target
				}
			}
		}
	}
	
	ds_list_destroy(hitByAttackNow);
	mask_index = asset_get_index("spr_" + character + "_stand_strip2");;
}