/// @desc fire_gatling_bullet(bullet_obj)
/// @arg bullet_object
function fire_gatling_bullet(argument0) {

	var _bullet = argument0;

	var dir1 = dir + random_range(-5, 5);

	if have_special {
	    var count = 3; 
	} else {
	    var count = 1;
	}

	repeat (count) {
	    var bullet = instance_create_layer(x,  y, "Layer_Bullet", _bullet);
	    var dir1 = dir + random_range(-5, 5);
	    bullet.dir = dir1;
	    bullet.image_angle = dir1;
	    if dir1 > 90 and dir1 < 270 bullet.image_yscale =-1;
	}



}
