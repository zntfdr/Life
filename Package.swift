// swift-tools-version:5.5

import PackageDescription

let package = Package(
  name: "Life",
  products: [
    .library(name: "Life", targets: ["Life"]),
    .executable(name: "life-cli", targets: ["lifeCLI"])
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-argument-parser.git",
             .upToNextMinor(from: "1.0.1")),
    .package(url: "https://github.com/apple/swift-tools-support-core.git",
             .upToNextMinor(from: "0.2.4"))
  ],
  targets: [
    .executableTarget(
      name: "lifeCLI",
      dependencies: [
        .product(name: "SwiftToolsSupport-auto",
                 package: "swift-tools-support-core"),
        .product(name: "ArgumentParser",
                 package: "swift-argument-parser"),
        "Life"
      ]),
    .target(name: "Life"),
    .testTarget(name: "LifeTests", dependencies: ["Life"])
  ]
)
