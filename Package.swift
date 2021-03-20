// swift-tools-version:5.3

import Foundation
import PackageDescription

let package = Package(
    name: "AnyScheduler",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6)],
    products: [
        .library(
            name: "AnyScheduler",
            targets: ["AnyScheduler"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "AnyScheduler",
            dependencies: [])
    ]
)

if ProcessInfo.processInfo.environment["DEV_DEPENDENCIES"] != nil {
    package.targets.append(
        .testTarget(
            name: "AnySchedulerTests",
            dependencies: ["AnyScheduler", "Thresher"])
    )

    package.dependencies.append(
        contentsOf: [
            .package(url: "https://github.com/inamiy/Thresher.git", .branch("nested-scheduling"))
        ]
    )
}
