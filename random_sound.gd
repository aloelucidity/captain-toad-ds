extends AudioStreamPlayer

export(Array, AudioStream) var streams

func _init():
	randomize()

func play_random(position : float = 0):
	stream = streams[rand_range(0, streams.size())]
	play(position)
