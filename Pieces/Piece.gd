extends Node2D

const BOARD_POS:Vector2 = Vector2(560,140);
const SIZE:Vector2 = Vector2(100,100);
var TYPE:String = 'NULL';

var pos:Vector2 = Vector2.ZERO;
var beingMoved:bool = false;
var team:String = 'white'

var hasMoved:bool = false

var BLACK_TEAM_TEXTURE = load("res://Sprites/Pieces/null.png") 
var WHITE_TEAM_TEXTURE = load("res://Sprites/Pieces/null.png") 

var EMPTY_TEXTURE = load('res://Sprites/Pieces/empty.png')

var DECAL_NODE = preload("res://MouseDecal.tscn")
var decal = null;

var availableMoves : Array = [];

onready var sprite : Sprite = get_node('Sprite');

func init(_pos, _team, _hasMoved):
	initConstants();
	pos = _pos;
	team = _team;
	hasMoved = _hasMoved
	ResetPixelPos();
	return self;
	
func initConstants():
	TYPE = 'NULL';
	BLACK_TEAM_TEXTURE = load("res://Sprites/Pieces/null.png")
	WHITE_TEAM_TEXTURE = load("res://Sprites/Pieces/null.png") 
	
func GetAvailableMoves():
	var board = get_parent().get_parent().board;
	var moves = [];
	
	var targets = GetTargets(board)
	
	moves.append(self.pos)
	
	for target in targets:
		if target.x >= 0 && target.x <= 7 && target.y >= 0 && target.y <= 7:
			var targetPiece = board[target.x][target.y].piece
			if (targetPiece.TYPE != 'EMPTY' && targetPiece.team != self.team) || targetPiece.TYPE == 'EMPTY':
				moves.append(target)
				
	return moves;

func GetTargets(board):
	var targets = [];
	
	for col in board:
			for cell in col:
				targets.append(cell.pos);
	
	return targets;
	
func _ready():
	if(team == "white"):
		sprite.texture = WHITE_TEAM_TEXTURE
	pass;

func ResetPixelPos():
	var pos_x = pos.x * 100; 
	var pos_y = pos.y * 100;
	
	position = Vector2(pos_x, pos_y);

func PickUp():
	availableMoves = GetAvailableMoves();
	beingMoved = true;
	
	decal = DECAL_NODE.instance().init(TYPE, position);
	add_child(decal)
	
	sprite.texture = EMPTY_TEXTURE;

func Drop():
	self.hasMoved = true;

func OnClick():
	get_parent().OnPieceClicked()

func Kill():
	queue_free();

func _on_Piece_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			OnClick();
