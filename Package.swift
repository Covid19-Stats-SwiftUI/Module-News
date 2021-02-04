// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "News",
	platforms: [.iOS(.v14)],
	products: [
		// Products define the executables and libraries a package produces, and make them visible to other packages.
		.library(
			name: "News",
			targets: ["News"]),
	],
	dependencies: [
		.package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.2.0")),
    .package(name: "Covid19StatsCore", url: "https://github.com/Covid19-Stats-SwiftUI/Covid19StatsCore.git", from: "1.0.0"),
	],
	targets: [
		.target(
			name: "News",
			dependencies: [
				"Alamofire",
				"Covid19StatsCore"
			]),
		.testTarget(
			name: "NewsTests",
			dependencies: ["News"]),
	]
)
