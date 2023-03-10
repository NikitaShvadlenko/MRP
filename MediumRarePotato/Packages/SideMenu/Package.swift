// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SideMenu",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SideMenu",
            targets: ["SideMenu"])
    ],
    dependencies: [
        .package(url: "https://github.com/SnapKit/SnapKit", from: "5.0.1"),
        .package(path: "../SharedResources"),
        .package(path: "../Utils"),
        .package(path: "../MyRestaurants"),
        .package(path: "../GameData")

    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SideMenu",
            dependencies: [
                "Utils",
                "SnapKit",
                "SharedResources",
                "MyRestaurants",
                "GameData"
            ])
    ]
)
