extends Node3D

var canTalk: bool = true
@export var resource: Resource
@onready var dialogue_manager = get_node("%DialogueManager")

func promptConvo():
	if (canTalk == true):
		canTalk = false
		dialogue_manager.dialogue_resource = resource
		dialogue_manager.show_dialogue("start")
