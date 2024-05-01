extends "res://Pieces/Piece.gd"

func initConstants():
	TYPE = 'BISHOP';
	BLACK_TEAM_TEXTURE = load("res://Sprites/Pieces/bishop.png")
	WHITE_TEAM_TEXTURE = load("res://Sprites/Pieces/white_bishop.png") 



func GetTargets(board):
	var targets = [];
	
	#nw
	var x = self.pos.x - 1;
	var y = self.pos.y - 1;
	
	while x >= 0 and y >= 0:
		targets.append(Vector2(x, y))
		var pieceAtCell = board[x][y].piece
		if(pieceAtCell.TYPE != 'EMPTY'):
			x = -1
			y = -1
		y -= 1;
		x -= 1;
	
	#ne
	x = self.pos.x + 1;
	y = self.pos.y - 1;
	
	while x <= 7 and y >= 0:
		targets.append(Vector2(x, y))
		var pieceAtCell = board[x][y].piece
		if(pieceAtCell.TYPE != 'EMPTY'):
			x = 9
			y = -1
		y -= 1;
		x += 1;
	
	#sw
	x = self.pos.x - 1;
	y = self.pos.y + 1;
	
	while x >= 0 and y <= 7:
		targets.append(Vector2(x, y))
		var pieceAtCell = board[x][y].piece
		if(pieceAtCell.TYPE != 'EMPTY'):
			x = -1
			y = 9
		y += 1;
		x -= 1;
	
	#se
	x = self.pos.x + 1;
	y = self.pos.y + 1;
	
	while x <= 7 and y <= 7:
		targets.append(Vector2(x, y))
		var pieceAtCell = board[x][y].piece
		if(pieceAtCell.TYPE != 'EMPTY'):
			x = 9
			y = 9
		y += 1;
		x += 1;
	
	return targets;
