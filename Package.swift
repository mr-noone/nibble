// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Nibble",
  platforms: [.iOS(.v9)],
  products: [
    .library(name: "Nibble", targets: ["Nibble"]),
  ],
  targets: [
    .target(name: "Nibble", dependencies: [])
  ]
)
