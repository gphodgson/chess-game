extends Node2D

const EMPTY_PIECE_NODE = preload("res://Pieces/Empty.tscn");

var pos: Vector2 = Vector2(0,0);
var piece = null

func init(_pos):
	pos = _pos;
	piece = EMPTY_PIECE_NODE.instance().init(pos, 'white', false)
	add_child(piece)
	return self;
	
func _ready():
	pass
	
func OnPieceClicked():
	get_parent().OnCellClicked(self);

func SetPiece(_piece):
	self.piece.Kill()
	_piece.pos = self.pos
	self.piece = _piece;
	self.piece.ResetPixelPos();
	add_child(self.piece)
