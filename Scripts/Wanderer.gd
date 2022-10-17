extends Node


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

var rayOrigin = Vector3()
var rayEnd = Vector3()

@export var ray_distance = 30
@export var confirm_scene: PackedScene

@onready var camera = get_node("%MainCamera")
@onready var guide = get_node("%Guide")

# Get the gravity from the project settings to be synced with RigidBody nodes.
# var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


# func _physics_process(delta):
# 	var intersection = check_ray_hit()
# 	if not intersection.empty():
# 		var target_position = intersection.position
# 		intersection.collider.add_child(target_spawn)

#func _process(delta):
	#var intersection = check_ray_hit()
	#if not intersection.is_empty():
		#guide.
		# var target_position = intersection.position
		# var confirm = confirm_scene.instantiate()
		# intersection.collider.add(confirm)


func check_ray_hit():
	var rid = $".".get_rid()
	var space_state = get_world_3d().direct_space_state
	var mouse_position = get_viewport().get_mouse_position()
	rayOrigin = camera.project_ray_origin(mouse_position)
	rayEnd = rayOrigin + camera.project_ray_normal(mouse_position) * ray_distance
	var rayQuery = PhysicsRayQueryParameters3D.create(rayOrigin, rayEnd)
	return space_state.intersect_ray(rayQuery)
