// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "Life",
    products: [
        .library(name: "Life", targets: ["Life"]),
        .executable(name: "life-cli", targets: ["lifeCLI"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git",
                 .upToNextMinor(from: "0.0.1")),
        .package(url: "https://github.com/apple/swift-tools-support-core.git",
                 .upToNextMinor(from: "0.0.1"))
    ],
    targets: [
        .target(
            name: "lifeCLI",
            dependencies: [
                .product(name: "SwiftToolsSupport",
                         package: "swift-tools-support-core"),
                .product(name: "ArgumentParser",
                          package: "swift-argument-parser"),
                "Life"
            ]),
        .target(
            name: "Life",
            dependencies: []),
        .testTarget(
            name: "LifeTests",
            dependencies: ["Life"]),
    ]
)
