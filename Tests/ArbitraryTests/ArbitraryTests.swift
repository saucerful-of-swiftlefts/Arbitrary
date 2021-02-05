@testable import Arbitrary

import XCTest

final class ArbitraryTests: XCTestCase {

	func testBool() {
		for _ in 0...25 {
			let generations = 200
			let generator = Bool.arbitrary
			let values: [Bool?] = Array(generator.prefix(generations))
			let counts = values.reduce(into: [Bool?: Int]()) { $0[$1, default: 0] += 1 }

			XCTAssertEqual(counts[.none] ?? 0, 0, "not every generation produced a value")
		}
	}
}
