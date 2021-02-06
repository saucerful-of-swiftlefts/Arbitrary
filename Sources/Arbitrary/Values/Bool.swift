extension Bool: ArbitrarilyIterable {
	
	public static var arbitrary: AnyGenerator<Bool> {
		Generator.Sequential<Bool>(from: [false, true])
			.cyclic()
			.shuffled()
			.eraseToAnyGenerator()
	}
}
