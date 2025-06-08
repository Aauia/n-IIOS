import SwiftUI

struct ProfileView: View {
    @ObservedObject var userManager: Manager
    @State private var lastHomework: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Profile")
                .font(.largeTitle)
                .padding()
            
            if let user = userManager.currentUser {
                Text("Name: \(user.firstName) \(user.lastName)")
                Text("Nickname: \(user.nickname)")
                
                TextField("Last Homework", text: $lastHomework, axis: .vertical)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Save Homework") {
                    saveHomework()
                }
                .padding()
            }
            
            Spacer()
            
            Button("Logout") {
                userManager.logout()
            }
            .foregroundColor(.red)
        }
        .padding()
        .onAppear {
            lastHomework = userManager.currentUser?.lastHomework ?? ""
        }
    }
    
    func saveHomework() {
        guard var user = userManager.currentUser else { return }
        user.lastHomework = lastHomework
        userManager.updateCurrentUser(user: user)
    }
}
