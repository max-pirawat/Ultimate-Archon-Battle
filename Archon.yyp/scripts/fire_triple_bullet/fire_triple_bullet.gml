/// @desc fire_triple_bullet(bullet_obj)
/// @arg bullet_object
function fire_triple_bullet(argument0) {

	var _bullet = argument0;

	if have_special {
	    var count = 3; 
	    var dir1 = dir - 10;
	} else {
	    var count = 1;
	    var dir1 = dir;
	}

	repeat (count) {
	    var bullet = instance_create_layer(x,  y, "Layer_Bullet", _bullet);
	    bullet.dir = dir1;
	    bullet.image_angle = dir1;
	    if dir1 > 90 and dir1 < 270 bullet.image_yscale =-1;
	    dir1 += 10;
	}



}
