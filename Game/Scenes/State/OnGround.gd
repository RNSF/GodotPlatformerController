extends State


func physics_step(host: Node, parent: Node, delta: float):
	var state_updates := .physics_step(host, parent, delta);
	if(nodes["KinematicBody2D"].is_on_floor()):
		var friction_mod := cos(nodes["KinematicBody2D"].get_floor_angle());
		var angle : float = host.velocity.angle_to(nodes["KinematicBody2D"].get_floor_normal());
		var mod := sign(angle);
		var max_value : float = abs(host.velocity.x)/delta;
		host.accelleration += clamp(
			host.friction*friction_mod,
			-max_value,
			max_value
		)*nodes["KinematicBody2D"].get_floor_normal().rotated(PI/2*mod);
		host.accelleration += host.friction*friction_mod*nodes["KinematicBody2D"].get_floor_normal().rotated(PI/2*mod);
	else:
		state_updates["InAir"] = true;
		state_updates["OnGround"] = false;
	return state_updates;
