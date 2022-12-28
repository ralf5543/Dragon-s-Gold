/// @description Gamepads detection

show_debug_message("Event = " + async_load[? "event_type"]);        // Debug code so you can see which event has been
show_debug_message("Pad = " + string(async_load[? "pad_index"]));   // triggered and the pad associated with it.
show_debug_message("test async ");

switch(async_load[? "event_type"])             // Parse the async_load map to see which event has been triggered
{
case "gamepad discovered":                     // A game pad has been discovered
    var pad = async_load[? "pad_index"];       // Get the pad index value from the async_load map
    gamepad_set_axis_deadzone(pad, 0.5);       // Set the "deadzone" for the axis
    gamepad_set_button_threshold(pad, 0.1);    // Set the "threshold" for the triggers
    if !(instance_exists(player[pad]))  {       // Check to see if an instance is associated with this pad index

		//place each player instance at quarter of the screen
		player[pad] = instance_create_layer(((room_width / 4) * pad) + (room_width / 8), 250, "layer_players", obj_player);
		
		player_id = player[pad].id;

		with (player[pad])
            {
            pad_num = pad;
			
			//give gamepad id to the obj_player, via gamepad_id_owner var
			gamepad_id_owner = other.player_id;
            }
        }
		total_pads ++;
	   
		
	
	        
    break;
case "gamepad lost":                           // Gamepad has been removed or otherwise disabled

    var pad = async_load[? "pad_index"];       // Get the pad index

	/*if (room == rm_select) {
	    if (instance_exists(player[pad]))          // Check for a player instance associated with the pad and remove it
	        {
	        with (player[pad]) {
	            instance_destroy();
	        }
	        player[pad] = noone;                   // Set the controller array to "noone" so it detects a new pad being connected
	    }
		
		with (player_number) {
			instance_destroy();
		}
	}*/
		
		total_pads --;

    break;
}























