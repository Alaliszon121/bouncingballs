extends Node2D

onready var scene = load("res://Ball/ball.tscn")

var i = 0
var score = 0
var counter = 0

signal update_score

func _ready():
	pass

func _on_ball_duplicate(pos, times):
	i = 0
	while i < times:
		pos.y = pos.y + 100
		var instance = scene.instance()
		instance.set_position(pos)
		call_deferred("add_child", instance)
		i += 1

func _on_Area2D_body_entered(body):
	score += 1
	emit_signal("update_score", score)
	body.queue_free()

func _on_Control_gui_input(event):
	if counter < 3:
		if Input.is_action_just_pressed("mouse_left_click"):
			event.position.x -= 1144
			event.position.y -= 1250
			var instance = scene.instance()
			instance.set_position(event.position)
			call_deferred("add_child", instance)
			counter += 1
