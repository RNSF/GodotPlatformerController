extends State

func enter(host: Node, parent: Node):
	var state_updates = .enter(host, parent);
	nodes["CanJumpTimer"].start(host.can_jump_time);
	nodes["CanJumpTimer"].paused = false;
	return state_updates;
