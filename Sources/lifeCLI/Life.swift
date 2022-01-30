import ArgumentParser
import Life

@main
struct Life: ParsableCommand {
  @Option(name: .shortAndLong, help: "The world rows number.")
  var rows: Int = 10

  @Option(name: .shortAndLong, help: "The world columns number.")
  var columns: Int = 80

  @Option(name: .shortAndLong, help: "The world mode. (simple|loop)")
  var mode: Mode = .simple

  func validate() throws {
    guard rows > 0, columns > 0 else {
      throw ValidationError("All dimensions must be greater than zero.")
    }
  }

  func run() throws {
    try Command(rows: rows, columns: columns, mode: mode).start()
  }
}
