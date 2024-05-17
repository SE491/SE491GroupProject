// FirebaseServicesExtensions.swift
import Firebase

extension Auth: FirebaseAuthenticating {
    func signIn(withEmail email: String, password: String) async throws -> FirebaseAuth.User {
        let result = try await signIn(withEmail: email, password: password)
        return result.user
    }

    func createUser(withEmail email: String, password: String) async throws -> FirebaseAuth.User {
        let result = try await createUser(withEmail: email, password: password)
        return result.user
    }

    func delete(user: FirebaseAuth.User, completion: @escaping (Error?) -> Void) {
        user.delete(completion: completion)
    }
}

extension Firestore: FirestoreHandling {
    func setData(for user: User, in collection: String) async throws {
        let encodedUser = try Firestore.Encoder().encode(user)
        let _ = try await collection(collection).document(user.id).setData(encodedUser)
    }

    func fetchUser(uid: String, from collection: String) async throws -> User? {
        let snapshot = try await collection(collection).document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }
}