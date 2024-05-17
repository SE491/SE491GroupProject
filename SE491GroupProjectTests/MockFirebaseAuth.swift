// MockFirebaseAuth.swift
import Firebase

class MockAuth: FirebaseAuthenticating {
    var shouldReturnError = false
    var mockedUser: FirebaseAuth.User?

    func signIn(withEmail email: String, password: String) async throws -> FirebaseAuth.User {
        if let user = mockedUser, !shouldReturnError {
            return user
        } else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Mock: Failed to sign in"])
        }
    }

    func createUser(withEmail email: String, password: String) async throws -> FirebaseAuth.User {
        if let user = mockedUser, !shouldReturnError {
            return user
        } else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Mock: Failed to create user"])
        }
    }

    func signOut() throws {
        if shouldReturnError {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Mock: Failed to sign out"])
        }
    }

    func sendPasswordReset(withEmail email: String, completion: @escaping (Error?) -> Void) {
        if shouldReturnError {
            completion(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Mock: Failed to send password reset email"]))
        } else {
            completion(nil)
        }
    }

    func delete(user: FirebaseAuth.User, completion: @escaping (Error?) -> Void) {
        if shouldReturnError {
            completion(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Mock: Failed to delete user"]))
        } else {
            completion(nil)
        }
    }
}