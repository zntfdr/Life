@testable import Life
import XCTest

final class WorldAddTests: XCTestCase {
  func testAddContainedCells() throws {
    // This world contains only one possible cell with row/column 0.
    var world = try World(rows: 1, columns: 1, mode: .simple)
    let cell = Cell(row: 0, column: 0)
    world.add(cell)

    XCTAssertEqual(world.aliveCells.count, 1)
    XCTAssertEqual(world.aliveCells.first, cell)
  }

  func testAddMultipleTimesSameCell() throws {
    // This world contains only one possible cell with row/column 0.
    var world = try World(rows: 1, columns: 1, mode: .simple)
    let cell = Cell(row: 0, column: 0)
    world.add(cell)
    world.add(cell)
    world.add(cell)
    world.add(cell)
    world.add(cell)

    XCTAssertEqual(world.aliveCells.count, 1)
    XCTAssertEqual(world.aliveCells.first, cell)
  }

  func testAddSetWithMixOfContainedAndUncontainedCells() throws {
    var world = try World(rows: 1, columns: 1, mode: .simple)

    world.add(Set<Cell>([Cell(row: 0, column: 0), Cell(row: 1, column: 1)]))

    XCTAssertEqual(world.aliveCells.count, 1)
    XCTAssertEqual(world.aliveCells.first, Cell(row: 0, column: 0))

    world = try World(rows: 2, columns: 2, mode: .simple)

    world.add(
      Set([
        Cell(row: -1, column: -1),
        Cell(row: 0, column: 0),
        Cell(row: 1, column: 1),
        Cell(row: 2, column: 2)
      ])
    )

    XCTAssertEqual(world.aliveCells.count, 2)
    XCTAssertTrue(world.aliveCells.contains(Cell(row: 0, column: 0)))
    XCTAssertTrue(world.aliveCells.contains(Cell(row: 1, column: 1)))
  }

  func testAddOutOfBoundCells() throws {
    // This world contains only one possible cell with row/column 0.
    var world = try World(rows: 1, columns: 1, mode: .simple)
    world.add(Cell(row: 0, column: 0).neighbours())

    XCTAssertTrue(world.aliveCells.isEmpty)
  }
}
