import Foundation

extension Collection where Element: Hashable {

	/// The estimated amount of entropy.
	///
	/// Based on [Shannon entropy from Rosetta](https://rosettacode.org/wiki/Entropy#Swift).
	///
	fileprivate var shannonEntropy: Double {
		guard !isEmpty else { return 0 }

		return
			self
				.reduce(into: [Element: Int]()) { $0[$1, default: 0] += 1 }
				.values
				.map { (i: Int) -> Double in Double(i) / Double(count) }
				.map { (p: Double) -> Double in -p * log2(p) }
				.reduce(0.0, +)
	}

	/// The amount of entropy, taking into account the distribution of values.
	var entropy: Double {
		let distributives = distribution.values.map(\.shannonEntropy)
		let overall = { (e: [Double]) -> Double in Double(e.reduce(0, +)) / Double(e.count) }(distributives)
		return (shannonEntropy + overall) / 2
	}

	var distribution: [Element: [Int]] {
		guard !isEmpty else { return [:] }

		return
			zip(self, (0...count))
				.reduce(into: [Element: (Int?, [Int])]()) { (results, elementWithIndex) in
					let element = elementWithIndex.0
					let offset = Int(elementWithIndex.1)
					let index = results[element] ?? (nil, [])
					let last = index.0
					let distances = index.1 + [offset - (last ?? 0)]

					results[element] = (offset, distances)
				}
				.reduce(into: [Element: [Int]]()) {
					$0[$1.0] = $1.1.1
				}
	}
}
