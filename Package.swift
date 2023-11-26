// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TinderSwipingAnimation",
    defaultLocalization: "fr",
    platforms: [
        .iOS(.v16)
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
