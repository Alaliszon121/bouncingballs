extends CanvasLayer

func _on_balls_update_score(score):
	$Panel/Score.text = String(score)
