public extension Generator {
	struct Closure<Element>: Sequence, IteratorProtocol {

		private let source: () -> Element?

		public init(_ block: @escaping () -> Element?) {
			source = block
		}

		public func next() -> Element? {
			source()
		}
	}
}
