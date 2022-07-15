extends Node
class_name State

export var active_state_paths = [];
var active_states := [];
var is_initialized = false;
var nodes := {};
var is_state = true;

func initialize(host: Node, parent: Node) -> void:
	is_initialized = true;
	for active_state_path in active_state_paths:
		active_states.append(get_node(active_state_path));
	
	for child in get_children():
		if(not "is_state" in child):
			remove_child(child);
			if(not host.has_node(child.name)):
				host.add_child(child);
				nodes[child.name] = child;
			else:
				nodes[child.name] = host.get_node(child.name)
				child.queue_free();

func enter(host: Node, parent: Node) -> Dictionary:
	if(!is_initialized):
		initialize(host, parent);
	
	var state_updates := {};
	
	for state in active_states:
		state_updates = merge_dictionaries([state_updates, update_states(state.enter(host, self), host)]);
	
	return state_updates

func step(host: Node, parent: Node, delta: float) -> Dictionary:
	var state_updates := {};
	
	for state in active_states:
		state_updates = merge_dictionaries([state_updates, update_states(state.step(host, self, delta), host)]);
	
	return state_updates

func physics_step(host: Node, parent: Node, delta: float) -> Dictionary:
	var state_updates := {};
	
	for state in active_states:
		state_updates = merge_dictionaries([state_updates, update_states(state.physics_step(host, self, delta), host)]);
	
	return state_updates

func exit(host: Node, parent: Node) -> Dictionary:
	var state_updates := {};
	
	for state in active_states:
		state_updates = merge_dictionaries([state_updates, update_states(state.exit(host, self), host)]);
	
	return state_updates

func update_states(state_updates: Dictionary, host) -> Dictionary:
	var state_updates_copy = state_updates.duplicate();
	for state_name in state_updates_copy:
		if(has_node(state_name)):
			if(state_updates[state_name]):
				state_updates = merge_dictionaries([state_updates, activate_state(state_name, host)]);
			else:
				state_updates = merge_dictionaries([state_updates, deactivate_state(state_name, host)]);
			state_updates.erase(state_name);
	return state_updates;
	
func activate_state(state_name: String, host: Node) -> Dictionary:
	var node := get_node(state_name);
	var state_updates := {};
	if(node != null):
		if(not active_states.has(node)):
			active_states.append(node);
			state_updates = merge_dictionaries([state_updates, update_states(node.enter(host, self), host)]);
	return state_updates

func deactivate_state(state_name: String, host: Node) -> Dictionary:
	var node := get_node(state_name);
	var state_updates := {};
	if(node != null):
		if(active_states.has(node)):
			active_states.erase(node);
		state_updates = merge_dictionaries([state_updates, update_states(node.exit(host, self), host)]);
	return state_updates

func merge_dictionaries(dictionaries: Array):
	var master_dictionary = {};
	for dictionary in dictionaries:
		for key in dictionary:
			master_dictionary[key] = dictionary[key];
	return master_dictionary;
