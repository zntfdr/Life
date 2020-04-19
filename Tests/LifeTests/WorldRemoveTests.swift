@testable import Life
import XCTest

final class WorldRemoveTests: XCTestCase {
  func testAddRemoveCell() throws {
    // This world contains only one possible cell with row/column 0.
    var world = try World(rows: 1, columns: 1, mode: .simple)
    let cell = Cell(row: 0, column: 0)
    world.add(cell)
    world.remove(cell)

    XCTAssertFalse(world.isCellAlive(cell))
    XCTAssertTrue(world.aliveCells.isEmpty)
  }

  func testRemoveUncontainedCells() throws {
    // This world contains only one possible cell with row/column 0.
    var world = try World(rows: 1, columns: 1, mode: .simple)
    let cell = Cell(row: 0, column: 0)
    world.remove(cell)

    XCTAssertFalse(world.isCellAlive(cell))
    XCTAssertTrue(world.aliveCells.isEmpty)
  }

  func testRemoveMultipleTimesSameCell() throws {
    var world = try World(rows: 2, columns: 2, mode: .simple)
    world.add(Set<Cell>([
      Cell(row: 0, column: 0),
      Cell(row: 0, column: 1),
      Cell(row: 1, column: 0),
      Cell(row: 1, column: 1)
    ]))

    let cell = Cell(row: 0, column: 0)
    world.remove(cell)
    world.remove(cell)
    world.remove(cell)
    world.remove(cell)
    world.remove(cell)

    XCTAssertFalse(world.isCellAlive(cell))
    XCTAssertEqual(world.aliveCells.count, 3)
    XCTAssertTrue(world.isCellAlive(Cell(row: 0, column: 1)))
    XCTAssertTrue(world.isCellAlive(Cell(row: 1, column: 0)))
    XCTAssertTrue(world.isCellAlive(Cell(row: 1, column: 1)))
  }

  func testRemoveSetWithMixOfContainedAndUncontainedCells() throws {
    var world = try World(rows: 2, columns: 2, mode: .simple)
    world.add(Set<Cell>([
      Cell(row: 0, column: 0),
      Cell(row: 0, column: 1),
      Cell(row: 1, column: 0),
      Cell(row: 1, column: 1)
    ]))

    world.remove(Set<Cell>([Cell(row: 0, column: 0), Cell(row: 0, column: 1)]))

    XCTAssertEqual(world.aliveCells.count, 2)
    XCTAssertTrue(world.isCellAlive(Cell(row: 1, column: 0)))
    XCTAssertTrue(world.isCellAlive(Cell(row: 1, column: 1)))
  }

  func testRemoveOutOfBoundCells() throws {
    // This world contains only one possible cell with row/column 0.
    var world = try World(rows: 1, columns: 1, mode: .simple)
    world.remove(Cell(row: 0, column: 0).neighbours())

    XCTAssertTrue(world.aliveCells.isEmpty)
  }
}
