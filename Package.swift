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
            url: "https://github.com/Amin-0-1/NetworkManager/releases/download/v1.2/NetworkManager.xcframework.zip",
            checksum: "fe543b7123d18052be5eac65351c1419473ede7813263fa43eec9f53e24787b1"
        ),
    ]
)
