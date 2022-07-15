extends State


func physics_step(host: Node, parent: Node, delta: float) -> Dictionary:
	var max_accelleration_change : float = host.velocity.length()/delta;
	host.accelleration += clamp(
		-host.drag*host.velocity.length(),
		-max_accelleration_change,
		max_accelleration_change
	)*host.velocity.normalized();
	return .physics_step(host, parent, delta);
	
