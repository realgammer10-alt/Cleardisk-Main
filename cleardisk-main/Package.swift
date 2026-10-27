// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "ClearDisk",
    platforms: [.macOS(.v14)],
    targets: [
        .target(
            name: "MonitoringCore",
            path: "Sources/MonitoringCore"
        ),
        .executableTarget(
            name: "ClearDisk",
            dependencies: ["MonitoringCore"],
            path: "Sources/ClearDisk"
        ),
        .testTarget(
            name: "MonitoringCoreTests",
            dependencies: ["MonitoringCore"],
            path: "Tests/MonitoringCoreTests"
        )
    ]
)
