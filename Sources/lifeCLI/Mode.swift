import ArgumentParser
import Life

extension Mode: ExpressibleByArgument {
  public init?(argument: String) {
    switch argument {
    case "loop":
      self = .loop
    case "simple":
      self = .simple
    default:
      return nil
    }
  }
}
