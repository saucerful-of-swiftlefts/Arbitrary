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
