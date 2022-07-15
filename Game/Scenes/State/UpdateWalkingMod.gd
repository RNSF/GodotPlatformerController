extends State

export var walk_mod := 1.0;

func enter(host: Node, parent: Node):
	host.walking_accelleration_mod = walk_mod;
	return .enter(host, parent);
