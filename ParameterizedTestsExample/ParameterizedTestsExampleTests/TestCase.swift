struct TestCase<Input, Output> {
    let input: Input
    let output: Output

    private let line: UInt

    init(
        input: Input,
        output: Output,
        line: UInt = #line
    ) {
        self.input = input
        self.output = output
        self.line = line
    }

    func message() -> String {
        return "🚨 Failed on line: \(line)"
    }
}
