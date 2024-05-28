// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NetworkManager",
    platforms: [.iOS(.v13), .macOS(.v11)],
    products: [
        .library(
            name: "NetworkManager",
            targets: ["NetworkManager"]),
    ],
    targets: [

        .binaryTarget(
            name: "NetworkManager",
            url: "https://github.com/Amin-0-1/NetworkManager/releases/download/1.3.3/NetworkManager.xcframework.zip",
            checksum: "1c85ac0bdfe07d7fad6e1ff8d27486e067ab7d024668e9ca731612b98e469630"
        ),
    ]
)
