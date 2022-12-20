// Script assets have changed for v2.3.0 see

function AddBlood(){
	var blood = instance_create_layer(other.x, other.y - 64, "front_decorations", obj_blood);
	blood.image_xscale = other.facing;
	with blood {
		skeleton_animation_set(choose("blood1", "blood2", "blood3"));
	}
}