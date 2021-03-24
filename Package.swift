// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "4.4.0-b.6"
let checksum = "898897f0c001007ae46191944cc042c5e19dcf2f45d07403d51d17cba783b153"

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
