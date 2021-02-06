public extension ArbitrarilyIterable where Self: CaseIterable {

	static var arbitrary: AnyGenerator<Self> {
		Generator.Sequential<Self>(from: allCases)
			.cyclic()
			.shuffled()
			.eraseToAnyGenerator()
	}
}
