import 'package:tictactoeflutter/tictactoe/cell_state.dart';

abstract class GameService{
  void startGame();
  void makeMove(int x, int y);
  List<List<CellState>> getBoard();
  CellState getTurn();
  CellState getWinner();
}