// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyLibrary",
    products: [
        .library(
            name: "Algorithm",
            targets: ["Algorithm"]),
    ],
    targets: [
        .target(
            name: "Algorithm"),
        .testTarget(
            name: "AlgorithmTests",
            dependencies: ["Algorithm"]
        ),
    ]
)
