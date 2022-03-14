extends Label

const BOXES_GROUP := "boxes"

var _score := 0


func _ready():
	for box in get_tree().get_nodes_in_group(BOXES_GROUP):
		if box is BoxHitbox:
			box.connect("was_picked_up", self, "_on_Box_was_picked_up")


func _on_Box_was_picked_up():
	_score += 1
	text = str(_score)
