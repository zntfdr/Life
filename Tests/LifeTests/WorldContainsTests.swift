@testable import Life
import XCTest

final class WorldContainsTests: XCTestCase {
  func testContainsCorrectValues() throws {
    // This world contains only one cell.
    let world = try World(rows: 1, columns: 1, mode: .simple)
    XCTAssertTrue(world.contains(Cell(row: 0, column: 0)))

    let neighbors = Cell(row: 0, column: 0).neighbours()

    for neighbor in neighbors {
      XCTAssertFalse(world.contains(neighbor))
    }
  }

  func testContainsWorldExtremes() throws {
    // This world contains only one cell.
    let world = try World(rows: 10, columns: 10, mode: .simple)

    // World Extremes
    // Top left corner.
    XCTAssertTrue(world.contains(Cell(row: 0, column: 0)))
    // Top right corner.
    XCTAssertTrue(world.contains(Cell(row: 0, column: 9)))
    // Bottom left corner.
    XCTAssertTrue(world.contains(Cell(row: 9, column: 0)))
    // Bottom right corner.
    XCTAssertTrue(world.contains(Cell(row: 9, column: 9)))

    // World Extremes + 1
    // Checking all invalid top left corner neighbors (clockwise).
    XCTAssertFalse(world.contains(Cell(row: 1, column: -1)))
    XCTAssertFalse(world.contains(Cell(row: 0, column: -1)))
    XCTAssertFalse(world.contains(Cell(row: -1, column: -1)))
    XCTAssertFalse(world.contains(Cell(row: 0, column: -1)))
    XCTAssertFalse(world.contains(Cell(row: 1, column: -1)))

    // Checking all invalid top right corner neighbors (clockwise).
    XCTAssertFalse(world.contains(Cell(row: -1, column: 8)))
    XCTAssertFalse(world.contains(Cell(row: -1, column: 9)))
    XCTAssertFalse(world.contains(Cell(row: -1, column: 10)))
    XCTAssertFalse(world.contains(Cell(row: 0, column: 10)))
    XCTAssertFalse(world.contains(Cell(row: 0, column: 11)))

    // Checking all invalid bottom left corner neighbors (clockwise).
    XCTAssertFalse(world.contains(Cell(row: 10, column: 1)))
    XCTAssertFalse(world.contains(Cell(row: 10, column: 0)))
    XCTAssertFalse(world.contains(Cell(row: 10, column: -1)))
    XCTAssertFalse(world.contains(Cell(row: 9, column: -1)))
    XCTAssertFalse(world.contains(Cell(row: 8, column: -1)))

    // Checking all invalid bottom right corner neighbors (clockwise).
    XCTAssertFalse(world.contains(Cell(row: 8, column: 10)))
    XCTAssertFalse(world.contains(Cell(row: 9, column: 10)))
    XCTAssertFalse(world.contains(Cell(row: 10, column: 10)))
    XCTAssertFalse(world.contains(Cell(row: 10, column: 9)))
    XCTAssertFalse(world.contains(Cell(row: 10, column: 8)))
  }

  func testContainsNegativeValues() throws {
    let world = try World(rows: 100, columns: 100, mode: .simple)

    XCTAssertFalse(world.contains(Cell(row: -20, column: 10)))
    XCTAssertFalse(world.contains(Cell(row: 20, column: -5)))
  }
}
