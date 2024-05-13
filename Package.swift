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
            url: "https://github.com/Amin-0-1/NetworkManager/releases/download/v1.2.1/NetworkManager.xcframework.zip",
            checksum: "7ac30d5d667499e59a497b824c9fe05dc7dbd2e10a9d87eb4bb08dc63b591aad"
        ),
    ]
)
