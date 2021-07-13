/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 606F284D
/// @DnDArgument : "var" "action"
/// @DnDArgument : "value" "irandom(4)"
var action = irandom(4);

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 4B3117D7
/// @DnDArgument : "var" "action"
if(action == 0)
{
	/// @DnDAction : YoYo Games.Movement.Jump_To_Point
	/// @DnDVersion : 1
	/// @DnDHash : 36641F6E
	/// @DnDParent : 4B3117D7
	/// @DnDArgument : "x" "128"
	/// @DnDArgument : "x_relative" "1"
	/// @DnDArgument : "y" "0"
	/// @DnDArgument : "y_relative" "1"
	x += 128;
	y += 0;
}

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 0595996E
/// @DnDArgument : "var" "action"
/// @DnDArgument : "value" "1"
if(action == 1)
{
	/// @DnDAction : YoYo Games.Movement.Jump_To_Point
	/// @DnDVersion : 1
	/// @DnDHash : 2130E306
	/// @DnDParent : 0595996E
	/// @DnDArgument : "x" "-128"
	/// @DnDArgument : "x_relative" "1"
	/// @DnDArgument : "y" "0"
	/// @DnDArgument : "y_relative" "1"
	x += -128;
	y += 0;
}

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 7FDB2C8A
/// @DnDArgument : "var" "action"
/// @DnDArgument : "value" "2"
if(action == 2)
{
	/// @DnDAction : YoYo Games.Movement.Jump_To_Point
	/// @DnDVersion : 1
	/// @DnDHash : 0D2F1E8D
	/// @DnDParent : 7FDB2C8A
	/// @DnDArgument : "x" "0"
	/// @DnDArgument : "x_relative" "1"
	/// @DnDArgument : "y" "128"
	/// @DnDArgument : "y_relative" "1"
	x += 0;
	y += 128;
}

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 14B2F1A8
/// @DnDArgument : "var" "action"
/// @DnDArgument : "value" "3"
if(action == 3)
{
	/// @DnDAction : YoYo Games.Movement.Jump_To_Point
	/// @DnDVersion : 1
	/// @DnDHash : 3438F1E6
	/// @DnDParent : 14B2F1A8
	/// @DnDArgument : "x" "0"
	/// @DnDArgument : "x_relative" "1"
	/// @DnDArgument : "y" "-128"
	/// @DnDArgument : "y_relative" "1"
	x += 0;
	y += -128;
}

/// @DnDAction : YoYo Games.Instances.Set_Alarm
/// @DnDVersion : 1
/// @DnDHash : 74A865C0
/// @DnDArgument : "steps" "60"
alarm_set(0, 60);