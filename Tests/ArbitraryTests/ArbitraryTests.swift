@testable import Arbitrary

import XCTest

final class ArbitraryTests: XCTestCase {

	func testBool() {
		for _ in 0...25 {
			let generations = Int.random(in: 0...500)
			let generator = Bool.arbitrary
			let values: [Bool?] = Array(generator.prefix(generations))
			let counts = values.reduce(into: [Bool?: Int]()) { $0[$1, default: 0] += 1 }
			let all: [Bool] = values.filter { $0 != nil }.map { $0! }

			XCTAssertEqual(counts[.none] ?? 0, 0, "not every generation produced a value")

			guard generations > 75 else { continue }

			XCTAssertGreaterThan(all.entropy, 1.25, "distribution is not random enough")
		}
	}
}
