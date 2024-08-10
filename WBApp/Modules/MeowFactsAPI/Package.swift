// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MeowFactsAPI",
    products: [
        .library(
            name: "MeowFactsAPI",
            targets: ["MeowFactsAPI"]),
    ],
    targets: [
        .target(
            name: "MeowFactsAPI"),
        .testTarget(
            name: "MeowFactsAPITests",
            dependencies: ["MeowFactsAPI"]),
    ]
)
