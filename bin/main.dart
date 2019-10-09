// Last time you wrote PrintBoard function which takes in the board and prints it to the console
// Today you have to take user input and populate the Board at required location

// Challenge 1
// Take user input like A1, B3, C2 etc. and put 'X' or 'O' in required places turn by turn

//  A   B   C
// 1   |   |
//  ---+---+---
// 2   |   |
//  ---+---+---
// 3   |   |

// X's move:
// A2

//    A   B   C
//  1    |   |
//    ---+---+---
//  2  X |   |
//    ---+---+---
//  3    |   |

//  0's move:
//  B2

//  A   B   C
//  1    |   |
//    ---+---+---
//  2  X | 0 |
//    ---+---+---
//  3    |   |

//  X's move:
//  B3

//  A   B   C
//  1    |   |
//    ---+---+---
//  2  X | 0 |
//    ---+---+---
//  3    | X |

//  0's move:
//  A2

//  A   B   C
// 1    |   |
//   ---+---+---
// 2  0 | 0 |
//   ---+---+---
// 3    | X |

//  X's move:
//  B2

//    A   B   C
//  1    |   |
//    ---+---+---
//  2  0 | X |
//    ---+---+---
//  3    | X |
//  0's move:

// HINT: to get string character you can use [], example String name ='Arnav'; name[0] gives 'A'

// Challenge 2
// Validate the move
// In case if there is already an entry on board print invalid move
import 'dart:io';

main() {
  var boardSize = 3;
  List<List<String>> board =
  List.generate(boardSize, (_) => List.filled(boardSize, ' '));
  String input;
  printBoard(board);
  int correctChoice = 0;
  String user = 'Player1';
  while (correctChoice < 9) {
    if (user == 'Player2') {
      print("Its the turn of Player2");
      input = stdin.readLineSync();
      if (board[boardRow(input)][boardColumn(input)] == 'O' ||
          board[boardRow(input)][boardColumn(input)] == 'X') {
        print('Please type valid Input like A1, B3, C2');
        continue;
      }
      board[boardRow(input)][boardColumn(input)] = 'O';
      correctChoice++;
      printBoard(board);
      user = 'x';
    } else {
      print("Its the turn of Player1");
      input = stdin.readLineSync();
      if (board[boardRow(input)][boardColumn(input)] == 'O' ||
          board[boardRow(input)][boardColumn(input)] == 'X') {
        print('Please type valid Input like A1, B3, C2');
        continue;
      }
      board[boardRow(input)][boardColumn(input)] = 'X';
      correctChoice++;
      printBoard(board);
      user = 'Player2';
    }

  }

}

void printBoard(List<List<String>> board) {
  print('   A   B   C ');
  List<String> rows = board.map(rowToString).toList();
  print('1 ${rows[0]}');
  print('  ---+---+---');
  print('2 ${rows[1]}');
  print('  ---+---+---');
  print('3 ${rows[2]}');
}

String rowToString(List<String> row) {
  return row.map((String val) => ' $val ').join('|');
}

int boardRow(String userInput) {
  int row;
  dynamic b = userInput[1];

  if (b == '1') {
    row = 0;
  }
  if (b == '2') {
    row = 1;
  }
  if (b == '3') {
    row = 2;
  }
//  print("row is $row and col is $col");

  return row;
}

int boardColumn(String userInput) {
  int col;
  dynamic a = userInput[0];

  if (a == 'A') {
    col = 0;
  }
  if (a == 'B') {
    col = 1;
  }
  if (a == 'C') {
    col = 2;
  }

//  print("row is $row and col is $col");

  return col;
}