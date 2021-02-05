public struct AnyGenerator<Element>: GenerativeSequence {

	public init<G: GenerativeSequence>(_ generator: G) where G.Element == Element {

	}

	public func next() -> Element? {
		nil
	}
}
