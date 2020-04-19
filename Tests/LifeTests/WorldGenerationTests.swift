@testable import Life
import XCTest

final class WorldGenerationTests: XCTestCase {
  func testEmptyWorldStayEmpty() throws {
    var world = try World(rows: 1, columns: 1, mode: .simple)

    XCTAssertTrue(world.nextGeneration().isEmpty)

    world.spawnNextGeneration()
    XCTAssertTrue(world.aliveCells.isEmpty)
  }

  func testLoneCellDies() throws {
    for mode in [Mode.simple, Mode.loop] {
      var world = try World(rows: 1, columns: 1, mode: mode)
      world.add(Cell(row: 0, column: 0))

      XCTAssertTrue(world.nextGeneration().isEmpty)

      world.spawnNextGeneration()
      XCTAssertTrue(world.aliveCells.isEmpty)
    }
  }
}
