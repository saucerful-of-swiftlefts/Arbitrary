@testable import Arbitrary

import XCTest

final class ClosureGeneratorTests: XCTestCase {

	func testGeneratingConstantValue() {
		let value = Int.random(in: 0...10000)
		let generator = Generator.Closure<Int> { value }

		for _ in 1...100 {
			XCTAssertEqual(value, generator.next())
		}
	}
}
