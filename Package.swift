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
        .library(
            name: "NetworkManager-debug",
            targets: ["NetworkManager-debug"]
        )
    ],
    targets: [
        
        .binaryTarget(
            name: "NetworkManager",
            url: "https://github.com/Amin-0-1/NetworkManager/releases/download/1.3.6/NetworkManager.xcframework.zip",
            checksum: "d43ed8142813a2bf7e40f6ae336263fbd57c64542b30ba6abe563c050e39535f"
        ),
        .binaryTarget(
            name: "NetworkManager-debug",
            url: "https://github.com/Amin-0-1/NetworkManager/releases/download/1.3.6/NetworkManager-debug.xcframework.zip",
            checksum: "60e42a46b2e8016f76192753d86b1cd9873ba82f736adff17ed0a2357ee9a3f6"
        )
    ]
)
