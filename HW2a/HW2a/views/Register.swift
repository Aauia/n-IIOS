import SwiftUI

struct RegisterView: View {
    @ObservedObject var manager: Manager
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var nickname = ""
    @State private var password = ""
    @State private var showError = false
    @State private var showSuccess = false
    
    var body: some View {
        Form {
            Section(header: Text("User Info")) {
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                TextField("Nickname", text: $nickname)
                    .autocapitalization(.none)
                SecureField("Password", text: $password)
            }
            
            Button("Register") {
                if firstName.isEmpty || lastName.isEmpty || nickname.isEmpty || password.isEmpty {
                    showError = true
                    return
                }
                if manager.register(firstName: firstName, lastName: lastName, nickname: nickname, password: password) {
                    showSuccess = true
                } else {
                    showError = true
                }
            }
        }
        .alert("Registration failed: Nickname taken or missing info", isPresented: $showError) {
            Button("OK", role: .cancel) { }
        }
        .alert("Registration successful! Please login.", isPresented: $showSuccess) {
            Button("OK") { }
        }
        .navigationTitle("Register")
    }
}

