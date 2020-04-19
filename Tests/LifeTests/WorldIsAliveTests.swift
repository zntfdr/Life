@testable import Life
import XCTest

final class WorldIsAliveTests: XCTestCase {
  func testInitialState() throws {
    let world = try World(rows: 1, columns: 1, mode: .simple)

    XCTAssertFalse(world.isCellAlive(Cell(row: 0, column: 0)))
  }

  func testNewCell() throws {
    let cell = Cell(row: 0, column: 0)
    var world = try World(rows: 1, columns: 1, mode: .simple)
    world.add(cell)

    XCTAssertTrue(world.isCellAlive(cell))
  }

  func testNewCellReset() throws {
    let cell = Cell(row: 0, column: 0)
    var world = try World(rows: 1, columns: 1, mode: .simple)
    world.add(cell)
    world.reset()

    XCTAssertFalse(world.isCellAlive(cell))
  }

  func testCellOutOfBound() throws {
    let world = try World(rows: 1, columns: 1, mode: .simple)

    let cell = Cell(row: 0, column: 0)

    for outOfBoundCell in cell.neighbours() {
      XCTAssertFalse(world.isCellAlive(outOfBoundCell))
    }
  }
}
