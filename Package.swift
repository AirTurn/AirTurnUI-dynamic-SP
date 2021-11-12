// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "4.5.2"
let checksum = "a6767fda48220ac7f6b092150f91aabe1425931fe31d8c4ee2137d58283a408a"

let package = Package(
    name: "AirTurnUI",
    platforms: [.iOS(.v9)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AirTurnUI",
            targets: ["AirTurnUITargets"]
        ),
    ],
    dependencies: [
        .package(name: "AirTurnInterface",
                         url: "https://github.com/AirTurn/AirTurnInterface-dynamic-SP.git",
                         from: Version(version)!
        )
    ],
    targets: [
        .binaryTarget(name: "AirTurnUI", url: "https://airturn.com/framework/AirTurnUI.\(version).dynamic.spm.zip", checksum: checksum),
        .target(name: "AirTurnUITargets",
                        dependencies: [
                            .target(name: "AirTurnUI"),
                            .product(name: "AirTurnInterface", package: "AirTurnInterface")
                        ],
                        path: "Sources"
        )
    ]
)
