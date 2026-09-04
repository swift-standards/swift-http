// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-http",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
    ],
    products: [
        .library(
            name: "HTTP",
            targets: ["HTTP"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-ietf/swift-rfc-9110.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-byte.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "HTTP",
            dependencies: [
                .product(
                    name: "RFC 9110",
                    package: "swift-rfc-9110"
                )
            ]
        ),
        .testTarget(
            name: "HTTP Tests",
            dependencies: [
                "HTTP",
                .product(name: "RFC 9110", package: "swift-rfc-9110"),
                .product(name: "Byte", package: "swift-byte"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
