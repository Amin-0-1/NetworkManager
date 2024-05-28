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
            url: "https://github.com/Amin-0-1/NetworkManager/releases/download/1.3.2/NetworkManager.xcframework.zip",
            checksum: "00e0dd5e1e312c926e2c9565af14bc648d2c5785eeba4ae9c0a0234fe94cf50c"
        ),
    ]
)
