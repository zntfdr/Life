/// The game mode.
public enum Mode {
  /// The world left and right edges are stitched together, the world top and
  /// bottom edges are stitched together.
  case loop

  /// Any cell outside of the world edges is considered dead.
  case simple
}
