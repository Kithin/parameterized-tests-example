import XCTest
@testable import ParameterizedTestsExample

final class ProfileDatabaseTests: XCTestCase {
    private var sut: ProfileDatabase!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = ProfileDatabase()
    }

    override func tearDownWithError() throws {
        sut = nil
        
        try super.tearDownWithError()
    }
    
    func test_returnProfileHasBeenCreatedMessage_whenCreatingProfile() throws {
        [
            TestCase(
                input: Profile(
                    firstName: "John",
                    lastName: nil,
                    email: nil,
                    phoneNumber: nil,
                    image: nil
                ),
                output: "🥳 profile has been created!"
            ),
            TestCase(
                input: Profile(
                    firstName: "John",
                    lastName: "Doe",
                    email: nil,
                    phoneNumber: nil,
                    image: nil
                ),
                output: "🥳 profile has been created!"
            ),
            TestCase(
                input: Profile(
                    firstName: "John",
                    lastName: "Doe",
                    email: "john_doe@example.com",
                    phoneNumber: nil,
                    image: nil
                ),
                output: "🥳 profile has been created!"
            ),
            TestCase(
                input: Profile(
                    firstName: "John",
                    lastName: "Doe",
                    email: "john_doe@example.com",
                    phoneNumber: 0123456789,
                    image: nil
                ),
                output: "🥳 profile has been created!"
            ),
            TestCase(
                input: Profile(
                    firstName: "John",
                    lastName: "Doe",
                    email: "john_doe@example.com",
                    phoneNumber: 0123456789,
                    image: URL(string: "http://image-example.com")
                ),
                output: "🥳 profile has been created!"
            )
        ].forEach { testCase in
            XCTAssertEqual(
                testCase.output,
                sut.create(testCase.input),
                testCase.message()
            )
        }
    }
}
