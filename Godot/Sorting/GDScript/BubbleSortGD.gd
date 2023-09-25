extends Sprite2D

var n: int = 100
var array: Array[int] = []
var array2 = []
var array3: PackedInt32Array = []
var flipped: bool = false
var should_flip: bool = true
var use_packed: bool = false
var use_typed: bool = true
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in n:
		array.append(i)
		array2.append(i)
		array3.append(i)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	sort_array()
	if should_flip:
		flipped = !flipped;

func sort_array():
	if use_packed:
		for i in n - 1:
			for j in n - 1:
				if (!flipped && array3[j] > array3[j+1]) || (flipped && array3[j] < array3[j + 1]):
					var temp: int = array3[j]
					array3[j] = array3[j + 1]
					array3[j + 1] = temp
	elif use_typed:
		for i in n - 1:
			for j in n - 1:
				if (!flipped && array[j] > array[j+1]) || (flipped && array[j] < array[j + 1]):
					var temp: int = array[j]
					array[j] = array[j + 1]
					array[j + 1] = temp
	else:
		for i in n - 1:
			for j in n - 1:
				if (!flipped && array2[j] > array2[j+1]) || (flipped && array2[j] < array2[j + 1]):
					var temp = array2[j]
					array2[j] = array2[j + 1]
					array2[j + 1] = temp
