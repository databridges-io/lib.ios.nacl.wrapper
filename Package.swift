// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "databridges_nacl_wrapper",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "databridges_nacl_wrapper",
            targets: ["databridges_nacl_wrapper"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(name: "TweetNacl",
                         url: "https://github.com/bitmark-inc/tweetnacl-swiftwrap",
                         .upToNextMajor(from: "1.0.0")),
        
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "databridges_nacl_wrapper",
            dependencies: ["TweetNacl"]),
        .testTarget(
            name: "databridges_nacl_wrapperTests",
            dependencies: ["databridges_nacl_wrapper"]),
    ]
)
