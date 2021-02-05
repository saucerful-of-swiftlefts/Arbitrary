public extension Generator {
	struct Sequential<Element>: GenerativeSequence {

		private var source: Closure<Element>

		public init<S: Sequence>(from input: S) where S.Element == Element {
			var iterator = input.makeIterator()
			source = Closure { iterator.next() }
		}

		public func next() -> Element? {
			source.next()
		}
	}
}
