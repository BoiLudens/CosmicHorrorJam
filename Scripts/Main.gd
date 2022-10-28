extends Node

@export var Balloon: PackedScene
@export var SmallBalloon: PackedScene
@export var title: String = "start"
@export var dialogue_resource: Resource

var start_time = Time.get_ticks_msec()
var runtime_sec: float 

# Called when the node enters the scene tree for the first time.
func _ready():
	DialogueManager.dialogue_finished.connect(_on_dialogue_finished)

func show_dialogue(key: String) -> void:
	var is_small_window: bool = ProjectSettings.get_setting("display/window/size/viewport_width") < 400
	var balloon: Node = (SmallBalloon if is_small_window else Balloon).instantiate()
	add_child(balloon)
	balloon.start(dialogue_resource, key)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	runtime_sec = float(Time.get_ticks_msec() - start_time)/1000
	#print("Elapsed time: ", runtime_sec)
	#print(int(runtime_sec/60))
	

func _on_dialogue_finished():
	await get_tree().create_timer(0.4)
	print("finished dialogue!")
