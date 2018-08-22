// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "SwiftSlug",
    dependencies: [],
    targets: [
        .target(name: "SwiftSlug", path: "Sources"),
        .testTarget(name: "SwiftSlugTests", dependencies: ["SwiftSlug"]),
    ]
)
