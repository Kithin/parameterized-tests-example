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
    
    func test_returnProfileHasBeenCreatedMessage_whenCreatingProfileWithOnlyFirstName() throws {
        let profile = Profile(
            firstName: "John",
            lastName: nil,
            email: nil,
            phoneNumber: nil,
            image: nil
        )
        
        let message = sut.create(profile)
        
        XCTAssertEqual("🥳 profile has been created!", message)
    }
    
    func test_returnProfileHasBeenCreatedMessage_whenCreatingProfileWithOnlyFirstNameAndLastName() throws {
        let profile = Profile(
            firstName: "John",
            lastName: "Doe",
            email: nil,
            phoneNumber: nil,
            image: nil
        )
        
        let message = sut.create(profile)
        
        XCTAssertEqual("🥳 profile has been created!", message)
    }
    
    func test_returnProfileHasBeenCreatedMessage_whenCreatingProfileWithOnlyFirstNameAndLastNameAndEmail() throws {
        let profile = Profile(
            firstName: "John",
            lastName: "Doe",
            email: "john_doe@example.com",
            phoneNumber: nil,
            image: nil
        )
        
        let message = sut.create(profile)
        
        XCTAssertEqual("🥳 profile has been created!", message)
    }
    
    func test_returnProfileHasBeenCreatedMessage_whenCreatingProfileWithOnlyFirstNameAndLastNameAndEmailAndPhoneNumber() throws {
        let profile = Profile(
            firstName: "John",
            lastName: "Doe",
            email: "john_doe@example.com",
            phoneNumber: 0123456789,
            image: nil
        )
        
        let message = sut.create(profile)
        
        XCTAssertEqual("🥳 profile has been created!", message)
    }
    
    func test_returnProfileHasBeenCreatedMessage_whenCreatingProfileWithAllArguments() throws {
        let profile = Profile(
            firstName: "John",
            lastName: "Doe",
            email: "john_doe@example.com",
            phoneNumber: 0123456789,
            image: URL(string: "http://image-example.com")
        )
        
        let message = sut.create(profile)
        
        XCTAssertEqual("🥳 profile has been created!", message)
    }
}
