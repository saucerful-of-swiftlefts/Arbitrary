public extension Generator {
	struct Empty<Element>: Sequence, IteratorProtocol {

		public init() {
		}

		public func next() -> Element? {
			nil
		}
	}
}
