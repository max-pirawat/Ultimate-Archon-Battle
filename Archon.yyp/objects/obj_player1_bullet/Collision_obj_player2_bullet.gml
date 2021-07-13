
var d = min(durability, other.durability);
durability -= d;
other.durability -= d;
if (other.durability <= 0) {
    instance_destroy(other);   
}

if (durability <= 0) {
    instance_destroy();   
}
