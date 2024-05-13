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
            url: "https://github.com/Amin-0-1/NetworkManager/releases/download/v1.2.4/NetworkManager.xcframework.zip",
            checksum: "8a83ad690903f3489370f81f6ab697b8184169b517690d2514a36940af4ba89a"
        ),
    ]
)
