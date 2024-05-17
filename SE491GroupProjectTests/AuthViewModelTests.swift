import XCTest
@testable import SE491GroupProject

final class AuthViewModelTests: XCTestCase {
    private var viewModel: AuthViewModel!
    private var mockAuth: MockAuth!

    override func setUp() {
        super.setUp()
        mockAuth = MockAuth()
        viewModel = AuthViewModel(auth: mockAuth)
    }

    func testSignInSuccess() async {
        mockAuth.mockedUser = FirebaseAuth.User(uid: "LEcivUowvvYab8mE8e3s5sXJbPR2", email: "admin@gmail.com")  // Assuming FirebaseAuth.User has this initializer
        do {
            let user = try await viewModel.signIn(withEmail: "admin@gmail.com", password: "123456789")
            XCTAssertEqual(user.email, "admin@gmail.com")
        } catch {
            XCTFail("SignIn should succeed")
        }
    }
}