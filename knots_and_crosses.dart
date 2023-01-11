/// A 2 player CLI knots and crosses game written in dart
/// Anirudh Koteshwar
/// 11-1-2023

import "dart:io";

List<List<String>> CreateBoard(){
	var Board = [
		['0','0','0'],
		['0','0','0'],
		['0','0','0']
	];
	return Board;
}

void DisplayBoard(List<List<String>> Board){
	for (var i = 0; i < 3; i++){
		for (var j = 0; j < 3; j++){

			if (j<2){
				stdout.write('${Board[i][j]} | ');
			}
			else {
				stdout.write('${Board[i][j]}\n');
			}
		}
		if (i<2){
			stdout.write('----------\n');
		}
	}
}

void main(){
	var b1 = CreateBoard();
	DisplayBoard(b1);
}