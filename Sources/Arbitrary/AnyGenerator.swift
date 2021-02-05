public struct AnyGenerator<Element>: GenerativeSequence {

	public init<G: GenerativeSequence>(_ generator: G) where G.Element == Element {

	}

	public func next() -> Element? {
		nil
	}
}

public extension GenerativeSequence {

	func eraseToAnyGenerator() -> AnyGenerator<Element> {
		.init(self)
	}
}
