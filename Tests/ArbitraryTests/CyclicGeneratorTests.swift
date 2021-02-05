@testable import Arbitrary

import XCTest

final class CyclicGeneratorTests: XCTestCase {

	func testEmptySourceDoesNotCycle() {
		var generator = Generator.Empty<Int>().cyclic()

		for _ in 1...100 {
			XCTAssertNil(generator.next())
		}
	}
}
