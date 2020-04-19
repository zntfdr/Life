@testable import Life
import XCTest

final class WorldStillPatternTests: XCTestCase {

  /// ╔════╗
  /// ║    ║
  /// ║ ██ ║
  /// ║ ██ ║
  /// ║    ║
  /// ╚════╝
  func testBlock() throws {
    for mode in [Mode.simple, Mode.loop] {
      var world = try World(rows: 4, columns: 4, mode: mode)

      world.add(Cell(row: 1, column: 1))
      world.add(Cell(row: 1, column: 2))
      world.add(Cell(row: 2, column: 1))
      world.add(Cell(row: 2, column: 1))

      let nextGeneration = world.nextGeneration()
      XCTAssertEqual(nextGeneration.count, 4)

      world.spawnNextGeneration()
      XCTAssertEqual(world.aliveCells, nextGeneration)
    }
  }

  /// ╔══════╗
  /// ║      ║
  /// ║  ██  ║
  /// ║ █  █ ║
  /// ║  ██  ║
  /// ║      ║
  /// ╚══════╝
  func testBeeHive() throws {
    for mode in [Mode.simple, Mode.loop] {
      var world = try World(rows: 5, columns: 6, mode: mode)

      world.add(Cell(row: 1, column: 2))
      world.add(Cell(row: 1, column: 3))
      world.add(Cell(row: 2, column: 1))
      world.add(Cell(row: 2, column: 4))
      world.add(Cell(row: 3, column: 2))
      world.add(Cell(row: 3, column: 3))

      let nextGeneration = world.nextGeneration()
      XCTAssertEqual(nextGeneration.count, 6)

      world.spawnNextGeneration()
      XCTAssertEqual(world.aliveCells, nextGeneration)
    }
  }
}
