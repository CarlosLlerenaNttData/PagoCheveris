// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PagoCheverisUI",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "PagoCheverisUI",
            targets: ["PagoCheverisUI"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/airbnb/lottie-ios.git", from: Version(3, 3, 0)),
        .package(url: "https://github.com/SnapKit/SnapKit.git", from: Version(5, 6, 0)),
        .package(url: "https://github.com/slackhq/PanModal.git", from: Version(1, 2, 7)),
        .package(url: "https://github.com/Flipboard/FLAnimatedImage", from: Version(1, 0, 15))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "PagoCheverisUI",
            dependencies: [.product(name: "Lottie", package: "lottie-ios"), "SnapKit", "PanModal", "FLAnimatedImage"],
            resources: [
                .process("Resources/PCLogo.json")
            ]),
        .testTarget(
            name: "PagoCheverisUITests",
            dependencies: ["PagoCheverisUI"]),
    ]
)
