other.hitpoint += -damage;
other.confuse_counter = confuse_duration;

if(other.hitpoint <= 0)
{
	with(other) {
	event_user(2);
	}
}

else
{
	with(other) {
	event_user(1);
	}
}

instance_destroy();