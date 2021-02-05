public extension Generator {
	struct Cyclic<Element, Source: GenerativeSequence>: GenerativeSequence
	where Source.Element == Element {

		public init(_ generator: Source) {
		}

		public func next() -> Element? {
			nil
		}
	}
}

public extension GenerativeSequence {

	func cyclic() -> Generator.Cyclic<Self.Element, Self> {
		.init(self)
	}
}
