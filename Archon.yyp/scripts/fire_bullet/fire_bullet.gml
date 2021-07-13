/// @desc fire_bullet(bullet_obj)
/// @arg bullet_object
function fire_bullet(argument0) {
	var _bullet = argument0;
	var bullet = instance_create_layer(x,  y, "Layer_Bullet", _bullet);
	bullet.dir = dir;
	bullet.image_angle = dir;
	if dir > 90 and dir < 270 bullet.image_yscale =-1;
}
