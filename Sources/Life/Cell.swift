/// A structure defining a point in a two-dimensional coordinate system.
public struct Cell: Hashable {
  /// The row-coordinate of the cell.
  public let row: Int

  /// The column-coordinate of the cell.
  public let column: Int

  /// Creates a cell with coordinates specified as integer values.
  public init(row: Int, column: Int) {
    self.row = row
    self.column = column
  }

  /// Returns the surrounding neighbours of the instance.
  func neighbours() -> Set<Cell> {
    var neighbours: Set<Cell> = []

    for rowΔ in -1...1 {
      for columnΔ in -1...1 {
        neighbours.insert(Cell(row: row + rowΔ, column: column + columnΔ))
      }
    }

    neighbours.remove(self)
    return neighbours
  }
}
