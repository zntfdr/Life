@testable import Life
import XCTest

final class WorldResetTests: XCTestCase {
  func testEmptyWorldStaysEmpty() throws {
    var world = try World(rows: 1, columns: 1, mode: .simple)
    world.reset()

    XCTAssertTrue(world.aliveCells.isEmpty)
  }

  func testFullWorldReset() throws {
    // 1x1 world
    var world = try World(rows: 1, columns: 1, mode: .simple)
    world.add(Cell(row: 0, column: 0))
    world.reset()

    XCTAssertTrue(world.aliveCells.isEmpty)

    // 2x2 world
    world = try World(rows: 2, columns: 2, mode: .simple)
    world.add(Cell(row: 0, column: 0))
    world.add(Cell(row: 0, column: 1))
    world.add(Cell(row: 1, column: 0))
    world.add(Cell(row: 1, column: 1))
    world.reset()

    XCTAssertTrue(world.aliveCells.isEmpty)
  }
}
