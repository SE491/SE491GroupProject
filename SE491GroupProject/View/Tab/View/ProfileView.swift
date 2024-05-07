//import SwiftUI
//
//struct ProfileView: View {
//    @EnvironmentObject var viewModel: AuthViewModel
//    
//    var body: some View {
//        List {
//            
//            Section("Account") {
//                
//                //sign out button
//                Button {
//                    viewModel.signOut()
//                } label: {
//                    ProfileRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: Color(.red))
//                }
//            }
//        }
//
//    }
//}
//
//#Preview {
//    ProfileView()
//}



import SwiftUI

// Ensure you import any necessary modules if your AuthViewModel is in a different module

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        List {
            Section(header: Text("User Info")) {
                HStack {
                    Text("Name: ")
                    Spacer()
                    Text(viewModel.currentUser?.fullname ?? "Unknown")
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                }

                HStack {
                    Text("Email: ")
                    Spacer()
                    Text(viewModel.currentUser?.email ?? "No Email")
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                }
            }

            Section("Account") {
                Button(action: {
                    viewModel.signOut()
                }) {
                    ProfileRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: Color.red)
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleUser = User(id: "1", fullname: "John Doe", email: "john@example.com")
        let authViewModel = AuthViewModel()
        authViewModel.currentUser = sampleUser
        return ProfileView().environmentObject(authViewModel)
    }
}
