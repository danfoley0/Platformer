extends Area2D

@onready var animation_player = $AnimationPlayer
@onready var jump_boost_timer = $Timer  # Assuming the Timer node is a direct child of the Area2D

# Jump boost value
var jump_boost_value = -450.0

func _on_body_entered(body:Node2D):
    if body is CharacterBody2D:
        var player_script = body as CharacterBody2D
        apply_jump_boost(player_script)
        animation_player.play("pickup")

func apply_jump_boost(player:CharacterBody2D):
    var original_jump_velocity = player.jump_velocity
    player.jump_velocity = jump_boost_value

    # Start the timer to reset jump velocity after it times out
    jump_boost_timer.start()
    jump_boost_timer.connect("timeout", Callable(self, "_reset_jump_boost").bind(player, original_jump_velocity))

func _reset_jump_boost(player:CharacterBody2D, original_jump_velocity):
    player.jump_velocity = original_jump_velocity
