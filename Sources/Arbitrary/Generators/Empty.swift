public extension Generator {
	struct Empty<Element>: GenerativeSequence {

		public init() {
		}

		public func next() -> Element? {
			nil
		}
	}
}
