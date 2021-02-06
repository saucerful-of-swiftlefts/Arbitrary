public protocol ArbitrarilyIterable {

	static var arbitrary: AnyGenerator<Self> { get }

}
