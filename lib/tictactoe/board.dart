import 'package:tictactoeflutter/tictactoe/cell_state.dart';

class Board {
  static const int rows = 3;
  static const int cols = 3;

  final List<List<CellState>> _board = [
    [CellState.empty, CellState.empty, CellState.empty],
    [CellState.empty, CellState.empty, CellState.empty],
    [CellState.empty, CellState.empty, CellState.empty]
  ];
  CellState _turn = CellState.X;
  CellState _winner = CellState.empty;

  CellState getTurn() {
    return _turn;
  }

  CellState getWinner() {
    return _winner;
  }

  List<List<CellState>> getBoard() {
    return _board;
  }

  bool makeMove(int row, int col) {
    if (_winner != CellState.empty) {
      return false;
    }
    if (row < 0 || row >= rows || col < 0 || col >= cols) {
      return false;
    }
    if (_board[row][col] == CellState.empty) {
      _board[row][col] = _turn;
      _turn = _turn == CellState.X ? CellState.O : CellState.X;
      return true;
    }
    return false;
  }

  bool checkWinner() {
    //check rows
    for (int row = 0; row < rows; row++) {
      if (_board[row][0] != CellState.empty && _board[row][0] == _board[row][1] && _board[row][1] == _board[row][2]) {
        _winner = _board[row][0];
        return true;
      }
    }
    //check columns
    for (int col = 0; col < cols; col++) {
      if (_board[0][col] != CellState.empty && _board[0][col] == _board[1][col] && _board[1][col] == _board[2][col]) {
        _winner = _board[0][col];
        return true;
      }
    }
    //check diagonals
    if (_board[0][0] != CellState.empty && _board[0][0] == _board[1][1] && _board[1][1] == _board[2][2]) {
      _winner = _board[0][0];
      return true;
    }
    if (_board[0][2] != CellState.empty && _board[0][2] == _board[1][1] && _board[1][1] == _board[2][0]) {
      _winner = _board[0][2];
      return true;
    }
    //check tie
    bool tie = true;
    for (int row = 0; row < rows; row++) {
      for (int col = 0; col < cols; col++) {
        if (_board[row][col] == CellState.empty) {
          tie = false;
        }
      }
    }
    if (tie) {
      _winner = CellState.tie;
      return true;
    }
    return false;
  }

}