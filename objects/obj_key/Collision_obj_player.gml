/// @description Insert description here
// You can write your code in this editor



if (other.state != PLAYERSTATE.HURT) && (other.state != PLAYERSTATE.DEAD) {
	
	audio_play_sound(snd_key_grab, 9, 0);

	switch (value) {
		case KEYVALUE.GOLD : 
		other.has_gold_key ++;
		break;	
	
		case KEYVALUE.SILVER : 
		other.has_silver_key ++;
		break;	
	
		case KEYVALUE.BRASS : 
		other.has_bronze_key ++;
		break;	
	}

	instance_destroy();

}