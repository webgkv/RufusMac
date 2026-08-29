// swift-tools-version: 6.0
import PackageDescription

// RufusMac — a native macOS bootable-USB creator with Liquid Glass UI.
// Developed by Harith Dilshan / h4rithd.com — built with the help of Claude Code.
//
// This Intel (x86_64) fork. Deployment floor is macOS 14; Liquid Glass on 26+,
// material fallback on 14/15. Packaging forces --arch x86_64.
//
// Two targets keep UI and logic cleanly separated and testable:
//   • RufusMacKit — pure Swift engine (disk enumeration, writers, checksums). No UI.
//   • RufusMac    — the SwiftUI app (@main), depends on RufusMacKit.
//
// Builds with the Command Line Tools toolchain (no full Xcode required).
// `scripts/build_app.sh` wraps the product into a portable RufusMac.app.
let commonSwiftSettings: [SwiftSetting] = [
    .swiftLanguageMode(.v5)
]

let package = Package(
    name: "RufusMac",
    platforms: [
        .macOS("14.0") // Material UI on 14/15; Liquid Glass when running on 26+
    ],
    targets: [
        .target(
            name: "RufusMacKit",
            path: "Sources/RufusMacKit",
            resources: [
                .process("Resources")
            ],
            swiftSettings: commonSwiftSettings
        ),
        .executableTarget(
            name: "RufusMac",
            dependencies: ["RufusMacKit"],
            path: "Sources/RufusMac",
            swiftSettings: commonSwiftSettings
        ),
        .executableTarget(
            name: "rmctl",
            dependencies: ["RufusMacKit"],
            path: "Sources/rmctl",
            swiftSettings: commonSwiftSettings
        ),
        .testTarget(
            name: "RufusMacKitTests",
            dependencies: ["RufusMacKit"],
            path: "Tests/RufusMacKitTests",
            swiftSettings: commonSwiftSettings
        )
    ]
)
