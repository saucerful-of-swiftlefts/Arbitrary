public extension Generator {
	struct Sequential<Element>: Sequence, IteratorProtocol {

		public init<S: Sequence>(from input: S) {
		}

		public func next() -> Element? {
			nil
		}
	}
}
