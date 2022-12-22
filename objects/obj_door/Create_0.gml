/// @description Door variables

side = undefined; // either "left" or "right" door in a hall

door_number = undefined;// The nth of the door in existings doors instances

skeleton_animation_set("open");
image_speed = 0;

is_opening = true;

var mask = instance_create_layer(x, y, "front_decorations", obj_door_mask);

with (mask) {
	skeleton_animation_set("mask");
}

