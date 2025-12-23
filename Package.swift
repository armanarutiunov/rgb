// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "rgb",
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.7.0"),
    ],
    targets: [
        .executableTarget(
            name: "rgb",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]
        ),
    ]
)
