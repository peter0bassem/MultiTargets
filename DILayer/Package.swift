// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DILayer",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DILayer",
            targets: ["DILayer"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.8.0"),
        .package(path: "../DataLayer"),
        .package(path: "../DomainLayer"),
        .package(path: "../UtilLayer")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "DILayer",
            dependencies: [
                "Swinject",
                .product(name: "DomainLayer", package: "DomainLayer"),
                .product(name: "DataLayer", package: "DataLayer"),
                .product(name: "UtilLayer", package: "UtilLayer")
            ]),
        .testTarget(
            name: "DILayerTests",
            dependencies: ["DILayer"]),
    ]
)
