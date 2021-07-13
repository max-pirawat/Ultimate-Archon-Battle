/// @description Apple

var w = room_width;
var h = room_height/2;
var offset = 20;

x = irandom_range(offset, w - offset);
y = h + irandom_range(offset, h - offset);
    
while (!place_empty(x,y)) {
    x = irandom_range(offset, w - offset);
    y = h + irandom_range(offset, h - offset);
}
