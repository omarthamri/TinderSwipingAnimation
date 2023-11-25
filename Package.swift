// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TinderSwipingAnimation",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "TinderSwipingAnimation",
            targets: ["TinderSwipingAnimation"]),
    ],
    targets: [
        .target(
            name: "TinderSwipingAnimation"),
    ]
)
