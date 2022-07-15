extends State

func physics_step(host: Node, parent: Node, delta: float):
	host.accelleration.y += host.gravity*host.gravity_mod;
	return .physics_step(host, parent, delta);
