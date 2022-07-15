extends State


func enter(host: Node, parent: Node):
	var state_updates := .enter(host, parent);
	state_updates["InAir"] = true;
	host.velocity.y = -host.jump_strength;
	return state_updates;

func step(host: Node, parent: Node, delta: float):
	var state_updates = .step(host, parent, delta);
	if(host.controls["JumpReleased"]):
		state_updates["Jump"] = false;
		state_updates["FastFall"] = true;
	return state_updates
