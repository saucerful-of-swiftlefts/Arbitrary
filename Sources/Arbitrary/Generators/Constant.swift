public extension Generator {
	struct Constant<Element>: Sequence, IteratorProtocol {

		private let source: Closure<Element>

		public init(_ value: Element) {
			source = Closure { value }
		}

		public func next() -> Element? {
			source.next()
		}
	}
}
