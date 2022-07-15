extends State

func enter(host, parent):
	#host.velocity.y = max(0, host.velocity.y);
	host.gravity_mod = 2.0;
	return .enter(host, parent);

func exit(host, parent):
	host.gravity_mod = 1.0;
	return .exit(host, parent);
