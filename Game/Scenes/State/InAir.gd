extends State

func enter(host, parent):
	return .enter(host, parent);

func physics_step(host: Node, parent: Node, delta: float):
	var state_updates := .physics_step(host, parent, delta);
	if(nodes["KinematicBody2D"].is_on_floor()):
		state_updates["InAir"] = false;
		state_updates["OnGround"] = true;
	return state_updates;
