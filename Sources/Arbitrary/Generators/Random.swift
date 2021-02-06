public extension Generator {
	struct Random<Element, Source: GenerativeSequence>: GenerativeSequence
	where Source.Element == Element {

		private var iterator: IndexingIterator<[Element]>? = nil

		private var buffer: [Element] = []

		private var bufferCapacity = 1024

		private var source: Source

		public init(_ generator: Source) {
			source = generator
		}

		public mutating func next() -> Element? {
			while true {
				if let value = iterator?.next() {
					return value
				}

				guard let value = source.next() else {
					return nil
				}

				buffer =
					Array(buffer.suffix(bufferCapacity / 2))
					+ [value]
					+ Array(source.prefix(bufferCapacity / 2 - 1))

				iterator = buffer.shuffled().makeIterator()
			}
		}
	}
}

public extension GenerativeSequence {

	func shuffled() -> Generator.Random<Self.Element, Self> {
		.init(self)
	}
}
