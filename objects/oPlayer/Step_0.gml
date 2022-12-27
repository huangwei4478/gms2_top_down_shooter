// get input
rightKey = keyboard_check(ord("D"));
leftKey = keyboard_check(ord("A"));
downKey = keyboard_check(ord("S"));
upKey = keyboard_check(ord("W"));

// player movement
#region
	// get direction
	var _horizontal = rightKey - leftKey;
	var _vertical = downKey - upKey;
	movedir = point_direction(0, 0, _horizontal, _vertical);
	
	// get the x and y speed
	var _spd = 0;
	var _inputLevel = point_distance(0, 0, _horizontal, _vertical);
	_inputLevel = clamp(_inputLevel, 0, 1);
	_spd = movespd * _inputLevel;
	
	xspd = lengthdir_x(_spd, movedir);
	yspd = lengthdir_y(_spd, movedir);
	
	// detect collision
	if (place_meeting(x + xspd, y, oWall)) {
		xspd = 0;
	}
	if (place_meeting(x, y + yspd, oWall)) {
		yspd = 0;
	}
	
	// move the player
	x += xspd;
	y += yspd;
	
	// depth
	depth = -bbox_bottom;

#endregion

// player aim
#region
	centerY = y + centerYOffset;
	aimDir = point_direction(x, centerY, mouse_x, mouse_y);

#endregion


// sprite control
#region
	face = round(aimDir / 90);
	if face == 4 { face = 0; }
	
	// animate
	if (xspd == 0 && yspd == 0) {
		image_index = 0;
	}
	
	// set the player sprite
	mask_index = sprite[3];
	sprite_index = sprite[face];

#endregion