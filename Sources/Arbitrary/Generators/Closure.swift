public extension Generator {
	struct Closure<Element>: Sequence, IteratorProtocol {

		public init(_ block: @escaping () -> Element?) {

		}

		public func next() -> Element? {
			nil
		}
	}
}
