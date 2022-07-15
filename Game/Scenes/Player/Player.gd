class_name Player
extends Node2D


onready var controller = $Controller;
onready var state_machine = $StateMachine;

var velocity := Vector2.ZERO;
var accelleration := Vector2.ZERO;
var can_jump_time = 0.3;
var friction := 1000.0;
var drag := 0.0;
var walking_accelleration := 5000.0;
var walking_accelleration_mod := 1.0;
var max_walk_speed := 500.0;
var jump_strength := 1000.0;
var gravity := 2000.0;
var gravity_mod := 1.0;
var controls := {
	"WalkingStrength" : 0.0,
	"Jump" : false,
};

func _ready() -> void:
	state_machine.enter(self, null);

func _process(delta: float) -> void:
	state_machine.step(self, null, delta);

func _physics_process(delta: float) -> void:
	state_machine.physics_step(self, null, delta);

func _exit_tree() -> void:
	state_machine.exit(self, null);
