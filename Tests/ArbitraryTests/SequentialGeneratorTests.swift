@testable import Arbitrary

import XCTest

final class SequentialGeneratorTests: XCTestCase {

	func testGeneration() {
		for _ in 1...100 {
			let input = (0...Int.random(in: 0...100))
			let generator = Generator.Sequential<Int>(from: input).eraseToAnyGenerator()

			XCTAssertEqual(Array(input), Array(generator))
		}
	}
}
