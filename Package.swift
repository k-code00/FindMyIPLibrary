// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FMIP",
    products: [
        .library(
            name: "FMIP",
            targets: ["FMIP"]),
    ],
    dependencies: [
        // Alamofire dependency
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.8.1"),
    ],
    targets: [
        .target(
            name: "FMIP",
            dependencies: ["Alamofire"]), // Include Alamofire in the target dependencies
        .testTarget(
            name: "FMIPTests",
            dependencies: ["FMIP"]),
    ]
)
