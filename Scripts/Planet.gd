extends Node3D

@export var dialogue_resource: Resource
@export var convo_titles = ["S1", "S2", "S3", "S4"]

@onready var dialogue_manager = get_node("%DialogueManager")

var can_talk: bool = true
var convo_index: int = 0

func _ready():
	var timer = Timer.new()
	timer.wait_time = 5.0
	timer.timeout.connect(_on_timer_timeout)
	timer.autostart = true
	add_child(timer)

func _on_timer_timeout():
	convo_index += 1
	can_talk = true

func promptConvo():
	if (can_talk == true):
		can_talk = false
		dialogue_manager.dialogue_resource = dialogue_resource
		dialogue_manager.show_dialogue(convo_titles[convo_index])

