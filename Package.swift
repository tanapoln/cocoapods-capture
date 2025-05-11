// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SKTCapture",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "SKTCapture",
            targets: ["SKTCaptureObjc", "SKTCapture", "SKTCaptureFramework"])
    ],
    targets: [
        .binaryTarget(
            name: "SKTCaptureFramework",
            path: "lib/SKTCapture.xcframework"
        ),
        .target(
            name: "SKTCapture",
            dependencies: ["SKTCaptureFramework", "SKTCaptureObjc"],
            // path: ".",
            sources: ["CaptureHelper.swift"],
            resources: [
                .copy("*.wav"),
                .copy("*.pem"),
            ],
            linkerSettings: [
                .linkedFramework("ExternalAccessory"),
                .linkedFramework("AudioToolbox"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreBluetooth"),
                .linkedLibrary("c++"),
                .linkedLibrary("icucore"),
            ]
        ),
        .target(
            name: "SKTCaptureObjc",
            publicHeadersPath: "."
        ),
    ],
    cxxLanguageStandard: .cxx14
)
