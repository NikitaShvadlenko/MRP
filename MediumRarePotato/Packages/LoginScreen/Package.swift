// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LoginScreen",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "LoginScreen",
            targets: ["LoginScreen"])
    ],
    dependencies: [
        .package(path: "../SharedResources"),
        .package(path: "../UIComponents"),
        .package(path: "../SharedExtensions"),
        .package(path: "../Networking"),
        .package(path: "../SharedModels"),
        .package(path: "../Utils"),

        .package(url: "https://github.com/SnapKit/SnapKit", from: "5.0.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "LoginScreen",
            dependencies: [
                "SharedResources",
                "UIComponents",
                "SharedExtensions",
                "Networking",
                "SharedModels",
                "Utils",
                "SnapKit"
            ])
    ]
)
