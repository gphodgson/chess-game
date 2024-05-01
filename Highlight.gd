extends Node2D

func init(pos):
	position = pos;
	return self;

func Kill():
	queue_free();

func _ready():
	pass 
