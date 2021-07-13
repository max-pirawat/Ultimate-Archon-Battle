/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 66A7DB29
/// @DnDInput : 4
/// @DnDArgument : "expr" "-damage"
/// @DnDArgument : "expr_relative" "1"
/// @DnDArgument : "expr_1" "fire_damage"
/// @DnDArgument : "expr_2" "fire_damage_steps"
/// @DnDArgument : "expr_3" "fire_damage_duration"
/// @DnDArgument : "var" "other.hitpoint"
/// @DnDArgument : "var_1" "other.fire_damage"
/// @DnDArgument : "var_2" "other.fire_damage_steps"
/// @DnDArgument : "var_3" "other.fire_damage_counter"
other.hitpoint += -damage;
other.fire_damage = fire_damage;
other.fire_damage_steps = fire_damage_steps;
other.fire_damage_counter = fire_damage_duration;

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 03C4EC5C
/// @DnDArgument : "var" "other.hitpoint"
/// @DnDArgument : "op" "3"
if(other.hitpoint <= 0)
{
	/// @DnDAction : YoYo Games.Instances.Call_User_Event
	/// @DnDVersion : 1
	/// @DnDHash : 3FCE0787
	/// @DnDApplyTo : other
	/// @DnDParent : 03C4EC5C
	/// @DnDArgument : "event" "2"
	with(other) {
	event_user(2);
	}
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 50817680
else
{
	/// @DnDAction : YoYo Games.Instances.Call_User_Event
	/// @DnDVersion : 1
	/// @DnDHash : 1D84E3A6
	/// @DnDApplyTo : other
	/// @DnDParent : 50817680
	/// @DnDArgument : "event" "1"
	with(other) {
	event_user(1);
	}
}

/// @DnDAction : YoYo Games.Instances.Destroy_Instance
/// @DnDVersion : 1
/// @DnDHash : 60721C9C
instance_destroy();