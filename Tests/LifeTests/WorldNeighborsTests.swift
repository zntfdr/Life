@testable import Life
import XCTest

final class WorldNeighborsTests: XCTestCase {
  func testNoNeighbors() throws {
    for mode in [Mode.simple, Mode.loop] {
      let world = try World(rows: 1, columns: 1, mode: mode)
      XCTAssertTrue(world.neighbours(for: Cell(row: 0, column: 0)).isEmpty)
    }
  }

  func test2x2WorldNeighbors() throws {
    for mode in [Mode.simple, Mode.loop] {
      let world = try World(rows: 2, columns: 2, mode: mode)

      let neighbours = world.neighbours(for: Cell(row: 0, column: 0))
      XCTAssertEqual(neighbours.count, 3)

      XCTAssertTrue(neighbours.contains(Cell(row: 0, column: 1)))
      XCTAssertTrue(neighbours.contains(Cell(row: 1, column: 0)))
      XCTAssertTrue(neighbours.contains(Cell(row: 1, column: 1)))
    }
  }

  func test3x3WorldNeighbors() throws {
    // Simple mode
    var world = try World(rows: 3, columns: 3, mode: .simple)

    let neighboursSimple = world.neighbours(for: Cell(row: 0, column: 0))
    XCTAssertEqual(neighboursSimple.count, 3)

    XCTAssertTrue(neighboursSimple.contains(Cell(row: 0, column: 1)))
    XCTAssertTrue(neighboursSimple.contains(Cell(row: 1, column: 0)))
    XCTAssertTrue(neighboursSimple.contains(Cell(row: 1, column: 1)))

    // Loop mode
    world = try World(rows: 3, columns: 3, mode: .loop)

    let neighboursLoop = world.neighbours(for: Cell(row: 0, column: 0))
    XCTAssertEqual(neighboursLoop.count, 8)

    XCTAssertTrue(neighboursLoop.contains(Cell(row: 0, column: 1)))
    XCTAssertTrue(neighboursLoop.contains(Cell(row: 1, column: 0)))
    XCTAssertTrue(neighboursLoop.contains(Cell(row: 1, column: 1)))
    XCTAssertTrue(neighboursLoop.contains(Cell(row: 0, column: 2)))
    XCTAssertTrue(neighboursLoop.contains(Cell(row: 1, column: 2)))
    XCTAssertTrue(neighboursLoop.contains(Cell(row: 2, column: 0)))
    XCTAssertTrue(neighboursLoop.contains(Cell(row: 2, column: 1)))
    XCTAssertTrue(neighboursLoop.contains(Cell(row: 2, column: 2)))
  }
}
