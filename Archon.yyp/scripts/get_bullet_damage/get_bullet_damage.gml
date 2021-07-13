// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_bullet_damage(bullet){
    var b = instance_create_depth(0, 0, 0, bullet);
    var result = b.damage;
    instance_destroy(b);
    return result;
}