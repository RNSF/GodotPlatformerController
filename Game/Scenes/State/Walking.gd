extends State


func physics_step(host: Node, parent: Node, delta: float):
	var max_accelleration_change := max(0, (host.max_walk_speed-host.velocity.x)/delta);
	var min_accelleration_change := min(0, (-host.max_walk_speed-host.velocity.x)/delta);
	host.accelleration += Vector2(clamp(
		host.controls["WalkingStrength"]*host.walking_accelleration*host.walking_accelleration_mod,
		min_accelleration_change, 
		max_accelleration_change
	), 0);
	return .physics_step(host, parent, delta);
	
