extends Node2D

export(int) var damage := 5
export(int) var speed := 100

var direction := Vector2.RIGHT

onready var _area: Area2D = $Area2D

func _physics_process(delta: float) -> void:
    for body in _area.get_overlapping_bodies():
        if body is Player:
            body.on_hit(damage)

    position += delta * direction.normalized() * speed

func on_camera_exited() -> void:
    queue_free()
