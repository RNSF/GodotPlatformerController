extends State

func step(host: Node, parent: Node, delta: float):
	host.controls["WalkingStrength"] = float(Input.is_action_pressed("move_right")) - float(Input.is_action_pressed("move_left"));
	host.controls["Jump"] = Input.is_action_just_pressed("jump");
	host.controls["JumpReleased"] = Input.is_action_just_released("jump");
	return .step(host, parent, delta);
