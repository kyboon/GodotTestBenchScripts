extends Sprite2D

var n: int = 100
var array: Array[int] = []
var array2 = []
var array3: PackedInt32Array = []
var flipped: bool = false
var should_flip: bool = true
var use_typed: bool = true
var use_packed: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in n:
		array.append(i)
		array2.append(i)
		array3.append(i)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if use_packed:
		array3.sort()
		if flipped:
			array3.reverse()
	elif use_typed:
		array.sort()
		if flipped:
			array.reverse()
	else:
		array2.sort()
		if flipped:
			array2.reverse()
			
	if should_flip:
		flipped = !flipped;
