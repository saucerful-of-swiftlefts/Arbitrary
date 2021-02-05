@testable import Arbitrary

import XCTest

final class EmptyGeneratorTests: XCTestCase {

	func testGeneration() {
		let generator = Generator.Empty<Int>()

		for _ in 1...100 {
			XCTAssertNil(generator.next())
		}
	}
}
