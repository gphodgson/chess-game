extends Node2D

const BOARD_POS:Vector2 = Vector2(560,140);
const SIZE:Vector2 = Vector2(100,100);

var nullImg = load("res://Sprites/Pieces/null.png") 
var pawnImg = load("res://Sprites/Pieces/pawn.png") 
var rookImg = load("res://Sprites/Pieces/rook.png") 
var queenImg = load("res://Sprites/Pieces/queen.png") 
var bishopImg = load("res://Sprites/Pieces/bishop.png") 
var kingImg = load("res://Sprites/Pieces/king.png") 
var knightImg = load("res://Sprites/Pieces/knight.png") 

var offset:Vector2 = Vector2.ZERO;
var type:String = 'NULL'
onready var sprite : Sprite = get_node('Sprite');

func init(type, offset):
	self.type = type;
	self.offset = offset;
	return self;
	
func _ready():
	if(self.type == 'NULL'):
		sprite.texture = nullImg;
	elif(self.type == 'PAWN'):
		sprite.texture = pawnImg;
	elif(self.type == 'ROOK'):
		sprite.texture = rookImg;
	elif(self.type == 'QUEEN'):
		sprite.texture = queenImg;
	elif(self.type == 'BISHOP'):
		sprite.texture = bishopImg;
	elif(self.type == 'KING'):
		sprite.texture = kingImg;
	elif(self.type == 'KNIGHT'):
		sprite.texture = knightImg;
	else:
		sprite.texture = nullImg;
		
func _process(delta):
	var mouse_pos = get_viewport().get_mouse_position()
	position = Vector2(mouse_pos.x - BOARD_POS.x - SIZE.x/2 - self.offset.x, mouse_pos.y - BOARD_POS.y -  SIZE.y/2 - self.offset.y);

func Kill():
	queue_free();
