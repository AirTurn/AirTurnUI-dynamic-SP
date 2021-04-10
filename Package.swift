// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "4.4.0"
let checksum = "8a9634299a9b916aa4ead563b35149374556648c6812f66f4d010b9e82b96d37"

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
