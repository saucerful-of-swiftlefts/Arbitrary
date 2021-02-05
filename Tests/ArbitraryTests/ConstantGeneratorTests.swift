@testable import Arbitrary

import XCTest

final class ConstantGeneratorTests: XCTestCase {

	func testGeneration() {
		let value = Int.random(in: 0...9999)
		let generator = Generator.Constant(value).eraseToAnyGenerator()

		for _ in 1...100 {
			XCTAssertEqual(value, generator.next())
		}
	}
}
