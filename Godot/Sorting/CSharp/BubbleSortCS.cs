using Godot;
using System;

public partial class BubbleSortCS : Sprite2D
{
	int[] array;
	int n = 100;
	bool flipped = false;
	bool should_flip = true;
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		array = new int[n];
		for (int i = 0; i < array.Length; i++) {
			array[i] = i;
		}
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		SortArray();
		if (should_flip)
			flipped = !flipped;
	}
	
	public void SortArray() {
		for (int i = 0; i < n - 1; i++) {
			for (int j = 0; j < n - i - 1; j++) {
				if ((!flipped && array[j] > array[j + 1]) || (flipped && array[j] < array[j + 1])) {
					var tempVar = array[j];
					array[j] = array[j + 1];
					array[j + 1] = tempVar;
				}
			}
		}
	}
}





