@testable import Life
import XCTest

final class CellTests: XCTestCase {
  func testInitialValues() {
    let rowColumnPairs: [(row: Int, column: Int)] = [
      (0, 0),
      (0, 500),
      (1, 1),
      (200, 333),
      (-1, -1),
      (5, 0)
    ]

    for rowColumnPair in rowColumnPairs {
      let cell = Cell(row: rowColumnPair.row, column: rowColumnPair.column)
      XCTAssertEqual(rowColumnPair.row, cell.row)
      XCTAssertEqual(rowColumnPair.column, cell.column)
    }
  }

  func testNeighboursNotContainSelf() {
    let cell = Cell(row: 0, column: 0)
    let neighbours: Set<Cell> = cell.neighbours()

    XCTAssertFalse(neighbours.contains(Cell(row: 0, column: 0)))
  }

  func testNeighboursNumber() {
    let cell = Cell(row: 0, column: 0)
    XCTAssertEqual(cell.neighbours().count, 8)
  }

  func testNeighbours() {
    let cell = Cell(row: 0, column: 0)
    let neighbours: Set<Cell> = cell.neighbours()

    // From top left to bottom right.
    XCTAssertTrue(neighbours.contains(Cell(row: -1, column: -1)))
    XCTAssertTrue(neighbours.contains(Cell(row: -1, column: 0)))
    XCTAssertTrue(neighbours.contains(Cell(row: -1, column: 1)))
    XCTAssertTrue(neighbours.contains(Cell(row: 0, column: -1)))
    XCTAssertTrue(neighbours.contains(Cell(row: 0, column: 1)))
    XCTAssertTrue(neighbours.contains(Cell(row: 1, column: -1)))
    XCTAssertTrue(neighbours.contains(Cell(row: 1, column: 0)))
    XCTAssertTrue(neighbours.contains(Cell(row: 1, column: 1)))
  }
}
