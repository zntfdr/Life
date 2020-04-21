/// The cell world.
///
/// A world is a succession of cells generations over time.
/// Each new generation is spawn from the previous one using the rules of the
/// Game Of Life.
///
/// - SeeAlso: https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life .
public struct World {
  /// The current generation alive cells.
  public internal(set) var aliveCells: Set<Cell> = []

  /// Number of rows in this world.
  public let rows: Int

  /// Number of columns in this world.
  public let columns: Int

  /// The game mode.
  public let mode: Mode

  public enum InitializationError: Error {
    /// All dimensions must be greater than zero.
    case nonPositiveDimension
  }

  /// Creates an empty world of the specified size.
  public init(rows: Int, columns: Int, mode: Mode = .simple) throws {
    guard rows > 0 && columns > 0 else {
      throw InitializationError.nonPositiveDimension
    }
    self.rows = rows
    self.columns = columns
    self.mode = mode
  }

  /// Adds the specified `cell` to the world alive cells.
  ///
  /// - Parameter cell: The alive cell to be added in the world.
  public mutating func add(_ cell: Cell) {
    guard contains(cell) else { return }
    aliveCells.insert(cell)
  }

  /// Adds the specified `cells` set to the world alive cells.
  ///
  /// - Parameter cells: The alive cells to be added in the world.
  public mutating func add(_ cells: Set<Cell>) {
    let cells = cells.filter { contains($0) }
    aliveCells.formUnion(Set(cells))
  }

  /// Removes the specified `cell` from the world alive cells.
  ///
  /// - Parameter cell: The cell to be removed from the world.
  public mutating func remove(_ cell: Cell) {
    aliveCells.remove(cell)
  }

  /// Removes the specified `cells` from the world alive cells.
  ///
  /// - Parameter cell: The cells to be removed from the world.
  public mutating func remove(_ cells: Set<Cell>) {
    aliveCells.subtract(cells)
  }

  /// Resets the instance to the initial empty state.
  public mutating func reset() {
    aliveCells = []
  }

  /// Update the instance with the next generation.
  public mutating func spawnNextGeneration() {
    self.aliveCells = nextGeneration()
  }

  /// Returns the instance next generation.
  func nextGeneration() -> Set<Cell> {
    var cellsWithNeighbours = self.cellsWithNeighbours()
    var newCells: Set<Cell> = []

    // Rule 1: Any live cell with two or three live neighbors survives.
    for cell in aliveCells {
      if
        let count = cellsWithNeighbours.removeValue(forKey: cell),
        2...3 ~= count {
        newCells.insert(cell)
      }
    }

    // Rule 2: Any dead cell with three live neighbors becomes a live cell.
    for (cell, count) in cellsWithNeighbours where count == 3 {
      newCells.insert(cell)
    }

    // Rule 3: All other dead cells stay dead.
    return newCells
  }

  /// Returns a dictionary containing as key all cells with at least one
  /// neighbour, and as value the exact number of neighbours for each cell.
  func cellsWithNeighbours() -> [Cell: Int] {
    var dictionary: [Cell: Int] = [:]

    for cell in aliveCells {
      for neighbour in neighbours(for: cell) {
        dictionary[neighbour, default: 0] += 1
      }
    }

    return dictionary
  }

  /// Returns the specified cell surrounding neighbours.
  func neighbours(for cell: Cell) -> Set<Cell> {
    let neighbours: [Cell]

    switch mode {
    case .simple:
      neighbours = cell.neighbours().filter { contains($0) }
    case .loop:
      neighbours = cell.neighbours()
        .map {
          Cell(
            row: ($0.row + rows) % rows,
            column: ($0.column + columns) % columns
          )
        }
        .filter { $0 != cell }
    }

    return Set(neighbours)
  }

  /// Returns `true` if `cell` is alive.
  public func isCellAlive(_ cell: Cell) -> Bool {
    aliveCells.contains(cell)
  }

  /// Returns `true` if `cell` can be part of this world.
  public func contains(_ cell: Cell) -> Bool {
    0..<rows ~= cell.row && 0..<columns ~= cell.column
  }
}
