// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyRestaurants",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MyRestaurants",
            targets: ["MyRestaurants"])
    ],
    dependencies: [
        .package(url: "https://github.com/SnapKit/SnapKit", from: "5.0.1"),
        .package(path: "../UIComponents"),
        .package(path: "../SharedResources"),
        .package(path: "../SharedExtensions"),
        .package(path: "../SharedModels"),
        .package(path: "../Networking"),
        .package(path: "../Utils")
    ],

    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "MyRestaurants",
            dependencies: [
            "UIComponents",
            "SharedResources",
            "SharedExtensions",
            "SharedModels",
            "Utils",
            "Networking",
            "SnapKit"
            ])
    ]
)
