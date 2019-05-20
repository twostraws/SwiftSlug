// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "SwiftSlug",
    products: [
        .library(
            name: "SwiftSlug",
            targets: ["SwiftSlug"]
        )
    ],
    dependencies: [ ],
    targets: [
        .target(
            name: "SwiftSlug",
            path: "Sources"
        ),
        .testTarget(
            name: "SwiftSlugTests",
            dependencies: ["SwiftSlug"]
        )
    ]
)
