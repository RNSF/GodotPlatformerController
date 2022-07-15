extends State


func enter(host, parent):
	var state_updates = .enter(host, parent);
	state_updates["FastFall"] = false;
	return state_updates;
