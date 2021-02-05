extension Bool {
	
	static var arbitrary: AnyGenerator<Bool> {
		Generator.Sequential<Bool>(from: [false, true])
			.eraseToAnyGenerator()
	}
}
