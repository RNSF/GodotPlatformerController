extends State

func enter(host: Node, parent: Node):
	var state_updates := .enter(host, parent);
	state_updates["CanJump"] = true;
	return state_updates;
