import ArgumentParser
import Life

struct Life: ParsableCommand {
  @Option(name: .shortAndLong, default: 10, help: "The world rows number.")
  var rows: Int

  @Option(name: .shortAndLong, default: 80, help: "The world columns number.")
  var columns: Int

  @Option(name: .shortAndLong, default: .simple, help: "The world mode. (simple|loop)")
  var mode: Mode

  func validate() throws {
    guard rows > 0, columns > 0 else {
      throw ValidationError("All dimensions must be greater than zero.")
    }
  }

  func run() throws {
    try Command(rows: rows, columns: columns, mode: mode).start()
  }
}
