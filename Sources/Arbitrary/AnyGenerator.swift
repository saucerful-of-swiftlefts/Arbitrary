public struct AnyGenerator<Element>: GenerativeSequence {

	private var source: Generator.Closure<Element>

	public init<G: GenerativeSequence>(_ generator: G) where G.Element == Element {
		var input = generator
		source = .init { input.next() }
	}

	public func next() -> Element? {
		source.next()
	}
}

public extension GenerativeSequence {

	func eraseToAnyGenerator() -> AnyGenerator<Element> {
		.init(self)
	}
}
