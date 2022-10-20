extends RigidBody3D

func _process(delta):
	var colliders = get_colliding_bodies()
	if !colliders.is_empty():
		for collider in colliders:
			if collider.name == "Planet Static Body":
				collider.helloWorld()
