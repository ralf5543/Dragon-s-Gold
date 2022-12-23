/// @description Door variables

side = undefined; // either "left" or "right" door in a hall

door_number = undefined;// The nth of the door in existings doors instances

skeleton_animation_set("open");
image_speed = 0;

is_opening = true;

var doorMask = instance_create_layer(x, y, "front_objects", obj_door_mask);

with (doorMask) {
	skeleton_animation_set("mask");
}

var wallMask = instance_create_layer(x + 54, y - 50, "front_objects", obj_wall_mask);