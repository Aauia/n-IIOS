import SwiftUI

struct LoginView: View {
    @ObservedObject var userManager: Manager
    
    @State private var nickname = ""
    @State private var password = ""
    @State private var showError = false
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Nickname", text: $nickname)
                .autocapitalization(.none)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Login") {
                if userManager.login(nickname: nickname, password: password) {
                    // Success
                } else {
                    showError = true
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            NavigationLink("Register", destination: RegisterView(manager: userManager))
                .padding(.top)
        }
        .padding()
        .alert("Invalid credentials", isPresented: $showError) {
            Button("OK", role: .cancel) { }
        }
        .navigationTitle("Login")
    }
}
