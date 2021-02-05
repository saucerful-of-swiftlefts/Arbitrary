public extension Generator {
	struct Cyclic<Element, Source: GenerativeSequence>: GenerativeSequence
	where Source.Element == Element {

		private var iterator: IndexingIterator<[Element]>? = nil

		private var elements: [Element] = []

		private var source: Source

		public init(_ generator: Source) {
			source = generator
		}

		public mutating func next() -> Element? {
			if let value = source.next() {
				elements.append(value)
				return value
			}

			while !elements.isEmpty {
				if let value = iterator?.next() {
					return value
				} else {
					self.iterator = elements.makeIterator()
				}
			}

			return nil
		}
	}
}

public extension GenerativeSequence {

	func cyclic() -> Generator.Cyclic<Self.Element, Self> {
		.init(self)
	}
}
