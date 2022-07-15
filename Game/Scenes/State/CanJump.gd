extends State

func enter(host: Node, parent: Node):
	var state_updates = .enter(host, parent);
	print("CAN JUMP")
	nodes["CanJumpTimer"].start(1.0);
	nodes["CanJumpTimer"].paused = true;
	return state_updates

func step(host: Node, parent: Node, delta: float) -> Dictionary:
	var state_updates := .physics_step(host, parent, delta);
	if(host.controls["Jump"]):
		state_updates["Jump"] = true;
		state_updates["CanJump"] = false;
	if(nodes["CanJumpTimer"].time_left <= 0):
		state_updates["CanJump"] = false;
	return state_updates;
