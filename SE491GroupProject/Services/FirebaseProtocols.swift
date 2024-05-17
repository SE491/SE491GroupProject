// FirebaseProtocols.swift
import Firebase
import FirebaseFirestoreSwift

protocol FirebaseAuthenticating {
    func signIn(withEmail email: String, password: String) async throws -> FirebaseAuth.User
    func createUser(withEmail email: String, password: String) async throws -> FirebaseAuth.User
    func signOut() throws
    func sendPasswordReset(withEmail email: String, completion: @escaping (Error?) -> Void)
    func delete(user: FirebaseAuth.User, completion: @escaping (Error?) -> Void)
}

protocol FirestoreHandling {
    func setData(for user: User, in collection: String) async throws
    func fetchUser(uid: String, from collection: String) async throws -> User?
}