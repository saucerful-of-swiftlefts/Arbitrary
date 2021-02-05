extension Bool {
	
	static var arbitrary: AnyGenerator<Bool> {
		Generator.Empty<Bool>()
			.eraseToAnyGenerator()
	}
}
