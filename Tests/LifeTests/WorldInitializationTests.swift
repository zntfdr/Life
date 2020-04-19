@testable import Life
import XCTest

final class WorldInitializationTests: XCTestCase {
  func testInitialValues() throws {
    let rowsColumnsPairs: [(rows: Int, columns: Int)] = [
      (10, 500),
      (1, 1),
      (200, 333),
      (5, 20)
    ]

    for rowColumnPair in rowsColumnsPairs {
      for mode in [Mode.simple, Mode.loop] {
        let world = try World(
          rows: rowColumnPair.rows,
          columns: rowColumnPair.columns,
          mode: mode
        )

        XCTAssertEqual(world.rows, rowColumnPair.rows)
        XCTAssertEqual(world.columns, rowColumnPair.columns)
        XCTAssertEqual(world.mode, mode)
      }
    }
  }

  func testNonPositiveDimensions() {
    for dimension in [0, -1] {
      for mode in [Mode.simple, Mode.loop] {
        do {
          _ = try World(rows: dimension, columns: dimension, mode: mode)
          XCTFail("World initialization should throw")
        } catch {
          XCTAssertEqual(
            error as? World.InitializationError,
            World.InitializationError.nonPositiveDimension
          )
        }
      }
    }
  }

  func testEmptyState() throws {
    let world = try World(rows: 1, columns: 1, mode: .simple)
    XCTAssertTrue(world.aliveCells.isEmpty)
  }

}
