extends Area2D

@onready var timer = $Timer  # Timer node to control post-collision behavior

func _on_body_entered(body: Node2D):
    if body.is_in_group("Player"):  # Ensure this is the player
        print("You died!")
        Engine.time_scale = 0.5
        # Queue_free the CollisionShape2D from the body
        var collision_shape = body.get_node("CollisionShape2D")
        if collision_shape:
            collision_shape.queue_free()
        # Start the timer for further actions (e.g., restarting the game)
        timer.start()
