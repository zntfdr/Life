import Life
import TSCBasic
import TSCLibc

struct Command {
  /// Number of rows in this world.
  public let rows: Int

  /// Number of columns in this world.
  public let columns: Int

  /// The game mode.
  public let mode: Mode

  /// The wait time until a new generation will spawn.
  let generationPeriod = UInt32(1_000_000 * 0.07)

  func start() throws {
    print("World running! Press ctrl-c to stop.")
    var world = try World(rows: rows, columns: columns, mode: mode)
    fillWorld(&world)

    while !world.aliveCells.isEmpty {
      printWorld(world)
      stdoutStream.flush()
      usleep(generationPeriod)
      world.spawnNextGeneration()
      clearWorld()
    }
    stdoutStream.flush()
  }

  /// Add a random number of alive cells, roughly ~50% of the whole world.
  func fillWorld(_ world: inout World) {
    for _ in 0...(world.rows * world.columns / 2) {
      world.add(
        Cell(
          row: .random(in: 0..<world.rows),
          column: .random(in: 0..<world.columns)
        )
      )
    }
  }

  /// Clears world from the terminal.
  func clearWorld() {
    for _ in 0..<rows {
      stdoutStream <<< "\u{001B}[2K\r\u{001B}[1A" // clear entire row & go up one row
    }
  }

  /// Prints the world into the terminal.
  func printWorld(_ world: World) {
    for row in 0..<world.rows {
      var line = ""
      for column in 0..<world.columns {
        let cell = Cell(row: row, column: column)
        line += world.isCellAlive(cell) ? "█" : " "
      }
      stdoutStream <<< "\(line)\u{001B}[0m\n"
    }
  }
}
