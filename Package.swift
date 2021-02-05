// swift-tools-version:5.3

import PackageDescription

let package = Package(
	name: "Arbitrary",
	products: [
		.library(
			name: "Arbitrary",
			targets: ["Arbitrary"]
		),
	],
	targets: [
		.target(
			name: "Arbitrary",
			dependencies: []
		),
		.testTarget(
			name: "ArbitraryTests",
			dependencies: [
				.target(name: "Arbitrary"),
			]
		),
	]
)
