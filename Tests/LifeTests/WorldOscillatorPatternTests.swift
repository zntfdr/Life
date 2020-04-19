@testable import Life
import XCTest

final class WorldOscillatorPatternTests: XCTestCase {

  /// ╔═════╗ ╔═════╗
  /// ║     ║ ║     ║
  /// ║  █  ║ ║     ║
  /// ║  █  ║ ║ ███ ║
  /// ║  █  ║ ║     ║
  /// ║     ║ ║     ║
  /// ╚═════╝ ╚═════╝
  ///
  /// Period: 2 generations
  func testBlinker() throws {
    for mode in [Mode.simple, Mode.loop] {
      var world = try World(rows: 5, columns: 5, mode: mode)

      world.add(Cell(row: 1, column: 3))
      world.add(Cell(row: 2, column: 3))
      world.add(Cell(row: 3, column: 3))

      let firstGeneration = world.aliveCells

      // Second generation
      world.spawnNextGeneration()
      let secondGeneration = world.aliveCells

      XCTAssertEqual(secondGeneration.count, 3)
      XCTAssertTrue(secondGeneration.contains(Cell(row: 2, column: 2)))
      XCTAssertTrue(secondGeneration.contains(Cell(row: 2, column: 3)))
      XCTAssertTrue(secondGeneration.contains(Cell(row: 2, column: 4)))

      // Third generation (start over)
      world.spawnNextGeneration()
      XCTAssertEqual(firstGeneration, world.aliveCells)
    }
  }

  /// ╔══════╗ ╔══════╗
  /// ║      ║ ║      ║
  /// ║   █  ║ ║      ║
  /// ║ █  █ ║ ║  ███ ║
  /// ║ █  █ ║ ║ ███  ║
  /// ║  █   ║ ║      ║
  /// ║      ║ ║      ║
  /// ╚══════╝ ╚══════╝
  ///
  /// Period: 2 generations
  func testToad() throws {
    for mode in [Mode.simple, Mode.loop] {
      var world = try World(rows: 6, columns: 6, mode: mode)

      world.add(Cell(row: 1, column: 3))
      world.add(Cell(row: 2, column: 1))
      world.add(Cell(row: 2, column: 4))
      world.add(Cell(row: 3, column: 1))
      world.add(Cell(row: 3, column: 4))
      world.add(Cell(row: 4, column: 2))

      let firstGeneration = world.aliveCells

      // Second generation
      world.spawnNextGeneration()
      let secondGeneration = world.aliveCells

      XCTAssertEqual(secondGeneration.count, 6)
      XCTAssertTrue(secondGeneration.contains(Cell(row: 2, column: 2)))
      XCTAssertTrue(secondGeneration.contains(Cell(row: 2, column: 3)))
      XCTAssertTrue(secondGeneration.contains(Cell(row: 2, column: 4)))
      XCTAssertTrue(secondGeneration.contains(Cell(row: 3, column: 1)))
      XCTAssertTrue(secondGeneration.contains(Cell(row: 3, column: 2)))
      XCTAssertTrue(secondGeneration.contains(Cell(row: 3, column: 3)))

      // Third generation (start over)
      world.spawnNextGeneration()
      XCTAssertEqual(firstGeneration, world.aliveCells)
    }
  }
}
