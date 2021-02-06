@testable import Arbitrary

import XCTest

final class RandomGeneratorTests: XCTestCase {

	func testEmptySourceIsNotShuffled() {
		var generator = Generator.Empty<Int>().shuffled()

		for _ in 1...100 {
			XCTAssertNil(generator.next())
		}
	}
}
