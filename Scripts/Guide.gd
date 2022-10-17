extends Area3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

var rayOrigin = Vector3()
var rayEnd = Vector3()

@export var ray_distance = 30

@onready var camera = get_node("%MainCamera")

func _process(delta):
	var intersection = check_ray_hit()
	if not intersection.is_empty():
		var target_position = intersection.position
		position = target_position


func check_ray_hit():
	var rid = $".".get_rid()
	var space_state = get_world_3d().direct_space_state
	var mouse_position = get_viewport().get_mouse_position()
	rayOrigin = camera.project_ray_origin(mouse_position)
	rayEnd = rayOrigin + camera.project_ray_normal(mouse_position) * ray_distance
	var rayQuery = PhysicsRayQueryParameters3D.create(rayOrigin, rayEnd)
	return space_state.intersect_ray(rayQuery)
