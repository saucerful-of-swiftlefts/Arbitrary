public extension Generator {
	struct Constant<Element>: Sequence, IteratorProtocol {

		public init(_ value: Element) {
		}

		public func next() -> Element? {
			nil
		}
	}
}
