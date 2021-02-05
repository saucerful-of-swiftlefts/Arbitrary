public extension Generator {
	struct Constant<Element>: GenerativeSequence {

		private let source: Closure<Element>

		public init(_ value: Element) {
			source = Closure { value }
		}

		public func next() -> Element? {
			source.next()
		}
	}
}
