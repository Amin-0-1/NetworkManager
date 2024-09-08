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
            url: "https://github.com/Amin-0-1/NetworkManager/releases/download/1.5.1/RELEASE.xcframework.zip",
            checksum: "3e7a5ce1332206e8697ddf32ad194001e58ac03e34ec0be0df8d79cdd1c82cb9"
        ),
        .binaryTarget(
            name: "NetworkManager-debug",
            url: "https://github.com/Amin-0-1/NetworkManager/releases/download/1.5.1/DEBUG.xcframework.zip",
            checksum: "b184efafb4922e0fcc5cd018cc6b3b7a8346bc902e7d5f001ac52dae11cc2753"
        )
    ]
)
