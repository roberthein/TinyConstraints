// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "TinyConstraints",
    products: [
        .library(name: "TinyConstraints", targets: ["TinyConstraints"])
    ],
    targets: [
        .target(
            name: "TinyConstraints",
            path: "TinyConstraints"
        )
    ]
)
