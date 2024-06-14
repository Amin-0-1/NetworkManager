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
            url: "https://github.com/Amin-0-1/NetworkManager/releases/download/1.5.0/RELEASE.xcframework.zip",
            checksum: "df7815ec5d0e179b2c40f5f5147bdaedea1ba10eb602bfa110fa9edf4c2258ac"
        ),
        .binaryTarget(
            name: "NetworkManager-debug",
            url: "https://github.com/Amin-0-1/NetworkManager/releases/download/1.5.0/DEBUG.xcframework.zip",
            checksum: "a51274c6896037370efcdd1e6c4bf4c27f4b61053b24b326f78b3614215e234f"
        )
    ]
)
