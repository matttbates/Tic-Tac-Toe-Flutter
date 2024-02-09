enum CellState {
  X, O, empty, tie;

  String get value {
    switch (this) {
      case CellState.X:
        return 'X';
      case CellState.O:
        return 'O';
      case CellState.empty:
        return '';
      case CellState.tie:
        return 'tie';
      default:
        return 'null';
    }
  }

}