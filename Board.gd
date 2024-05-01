extends Node2D

const BOARD_WIDTH = 8;
const BOARD_HEIGHT = 8;

const CELL_NODE = preload("res://Cell.tscn")

const EMPTY_PIECE_NODE = preload("res://Pieces/Empty.tscn")
const NULL_PIECE_NODE = preload("res://Pieces/Piece.tscn")
const PAWN_PIECE_NODE = preload("res://Pieces/Pawn.tscn")
const ROOK_PIECE_NODE = preload("res://Pieces/Rook.tscn")
const QUEEN_PIECE_NODE = preload("res://Pieces/Queen.tscn")
const BISHOP_PIECE_NODE = preload("res://Pieces/Bishop.tscn")
const KING_PIECE_NODE = preload("res://Pieces/King.tscn")
const KNIGHT_PIECE_NODE = preload("res://Pieces/Knight.tscn")

const HIGHLIGHT_NODE = preload("res://Highlight.tscn")

var board : Array = [];
var highlights: Array = [];

var turn: String = "white"

const initialBoardPieces = [
	['ROOK', Vector2(0,0), 'black'],
	['KNIGHT', Vector2(1,0), 'black'],
	['BISHOP', Vector2(2,0), 'black'],
	['QUEEN', Vector2(3,0), 'black'],
	['KING', Vector2(4,0), 'black'],
	['BISHOP', Vector2(5,0), 'black'],
	['KNIGHT', Vector2(6,0), 'black'],
	['ROOK', Vector2(7,0), 'black'],
	['PAWN', Vector2(0,1), 'black'],
	['PAWN', Vector2(1,1), 'black'],
	['PAWN', Vector2(2,1), 'black'],
	['PAWN', Vector2(3,1), 'black'],
	['PAWN', Vector2(4,1), 'black'],
	['PAWN', Vector2(5,1), 'black'],
	['PAWN', Vector2(6,1), 'black'],
	['PAWN', Vector2(7,1), 'black'],
	
	['ROOK', Vector2(0,7), 'white'],
	['KNIGHT', Vector2(1,7), 'white'],
	['BISHOP', Vector2(2,7), 'white'],
	['QUEEN', Vector2(3,7), 'white'],
	['KING', Vector2(4,7), 'white'],
	['BISHOP', Vector2(5,7), 'white'],
	['KNIGHT', Vector2(6,7), 'white'],
	['ROOK', Vector2(7,7), 'white'],
	['PAWN', Vector2(0,6), 'white'],
	['PAWN', Vector2(1,6), 'white'],
	['PAWN', Vector2(2,6), 'white'],
	['PAWN', Vector2(3,6), 'white'],
	['PAWN', Vector2(4,6), 'white'],
	['PAWN', Vector2(5,6), 'white'],
	['PAWN', Vector2(6,6), 'white'],
	['PAWN', Vector2(7,6), 'white'],
]

var pieceBeingMoved:bool = false
var originCell = null;

func _ready():
	randomize();
	for i in range(BOARD_WIDTH):
		board.append([])
		for j in range(BOARD_HEIGHT):
			var cell = CELL_NODE.instance().init(Vector2(i,j));
			add_child(cell);
			board[i].append(cell)
	print("created board")
	SetupBoardPieces();

func SetupBoardPieces():
	for pieceData in self.initialBoardPieces:
		var pieceType = pieceData[0];
		var piecePos = pieceData[1];
		var pieceTeam = pieceData[2]
		board[piecePos.x][piecePos.y].SetPiece(GetPieceByType(pieceType, pieceTeam, false, piecePos));

func OnCellClicked(clickedCell):
	if pieceBeingMoved == false:
		if(clickedCell.piece.TYPE != 'EMPTY' && clickedCell.piece.team == self.turn):
			pieceBeingMoved = true;
			clickedCell.piece.PickUp()
			originCell = clickedCell;
			
			ShowHighlights();
	else:
		if clickedCell.pos in originCell.piece.availableMoves:
			self.MakeMove(originCell, clickedCell)
	
func MakeMove(origin_cell, target_cell):
	var origin_type = origin_cell.piece.TYPE;
	var origin_team = originCell.piece.team;
	var hasMoved = true;
	
	if(originCell.pos == target_cell.pos && originCell.piece.hasMoved == false):
		hasMoved = false;
	
	if(originCell.pos != target_cell.pos):
		if(self.turn == 'white'):
			self.turn = 'black';
		else:
			self.turn = 'white';
			
	origin_cell.SetPiece(GetPieceByType('EMPTY', 'white', hasMoved, Vector2(0,0)));
	target_cell.SetPiece(GetPieceByType(origin_type, origin_team, hasMoved, Vector2(0,0)));
	
	pieceBeingMoved = false;
	KillHighlights();
	
func ShowHighlights():
	for move in originCell.piece.availableMoves:
		var highlight = HIGHLIGHT_NODE.instance().init(Vector2(move.x * 100, move.y * 100))
		add_child(highlight);
		highlights.append(highlight)

func KillHighlights():
	for highlight in highlights:
		highlight.Kill();
	highlights  = []

func GetPieceByType(type, team, hasMoved, pos):
	var pieceType = EMPTY_PIECE_NODE
	if(type == 'NULL'):
		pieceType = NULL_PIECE_NODE
	elif(type == 'PAWN'):
		pieceType = PAWN_PIECE_NODE
	elif(type == 'ROOK'):
		pieceType = ROOK_PIECE_NODE
	elif(type == 'QUEEN'):
		pieceType = QUEEN_PIECE_NODE
	elif(type == 'BISHOP'):
		pieceType = BISHOP_PIECE_NODE
	elif(type == 'KING'):
		pieceType = KING_PIECE_NODE
	elif(type == 'KNIGHT'):
		pieceType = KNIGHT_PIECE_NODE
	
	return pieceType.instance().init(pos, team, hasMoved);

