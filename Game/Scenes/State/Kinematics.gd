extends State

func physics_step(host: Node, parent: Node, delta: float):
	host.velocity += host.accelleration*delta;
	host.velocity = nodes["KinematicBody2D"].move_and_slide(host.velocity, Vector2.UP);
	host.global_position = nodes["KinematicBody2D"].global_position;
	nodes["KinematicBody2D"].position = Vector2.ZERO;
	host.accelleration = Vector2.ZERO;
	return .physics_step(host, parent, delta);
