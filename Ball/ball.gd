extends RigidBody2D

signal duplicate

var pos
var times

func _ready():
	connect("duplicate", get_parent(), "_on_ball_duplicate")

func duplicate_ball():
	pos = get_position()
	emit_signal("duplicate", pos, times)

func _on_two_times_checker_body_entered(_body):
	times = 1
	duplicate_ball()

func _on_three_times_checker_body_entered(_body):
	times = 2
	duplicate_ball()

func _on_delete_checker_body_entered(body):
	queue_free()
