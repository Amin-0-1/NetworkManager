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
            url: "https://github.com/Amin-0-1/NetworkManager/releases/download/1.4.0/RELEASE.xcframework.zip",
            checksum: "f3ce305f1bd7785eda01af9508f64fb85c85781ff5f030db4b9932cebefeb8c2"
        ),
        .binaryTarget(
            name: "NetworkManager-debug",
            url: "https://github.com/Amin-0-1/NetworkManager/releases/download/1.4.0/DEBUG.xcframework.zip",
            checksum: "17711360f4f581467468156f9b97684810dca1906155b0bbf8d6a26bcb24cda0"
        )
    ]
)
