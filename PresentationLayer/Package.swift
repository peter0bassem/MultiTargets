// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PresentationLayer",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "PresentationLayer",
            targets: ["PresentationLayer"]),
        .library(
            name: "EmaarResources",
            targets: ["EmaarResources"]),
        .library(
            name: "MultiTargetsResources",
            targets: ["MultiTargetsResources"]),
    ],
    dependencies: [
//        .package(url: "https://github.com/SDWebImage/SDWebImageSwiftUI.git", from: "3.0.0"),
        .package(path: "../DomainLayer"),
        .package(path: "../UtilLayer")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "PresentationLayer",
            dependencies: [
//                .product(name: "SDWebImageSwiftUI", package: "SDWebImageSwiftUI"),
                .product(name: "DomainLayer", package: "DomainLayer"),
                .product(name: "UtilLayer", package: "UtilLayer")
            ],
            resources: [.process("Resources")]
        ),
        .target(
            name: "EmaarResources",
            resources: [.process("Resources")]
        ),
        .target(
            name: "MultiTargetsResources",
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "PresentationLayerTests",
            dependencies: ["PresentationLayer"]),
    ]
)
