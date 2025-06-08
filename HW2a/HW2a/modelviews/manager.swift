
import SwiftUI
class Manager: ObservableObject {
    @Published var users: [User] = []
    @Published var currentUser: User? = nil
    
    private let usersKey = "users"
    private let currentUserKey = "currentUser"
    
    init() {
        loadUsers()
        loadCurrentUser()
    }
    
    func loadUsers() {
        if let data = UserDefaults.standard.data(forKey: usersKey),
           let decoded = try? JSONDecoder().decode([User].self, from: data) {
            users = decoded
        }
    }
    
    func saveUsers() {
        if let encoded = try? JSONEncoder().encode(users) {
            UserDefaults.standard.set(encoded, forKey: usersKey)
        }
    }
    
    func loadCurrentUser() {
        if let data = UserDefaults.standard.data(forKey: currentUserKey),
           let decoded = try? JSONDecoder().decode(User.self, from: data) {
            currentUser = decoded
        }
    }
    
    func saveCurrentUser() {
        if let user = currentUser,
           let encoded = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encoded, forKey: currentUserKey)
        } else {
            UserDefaults.standard.removeObject(forKey: currentUserKey)
        }
    }
    
    func register(firstName: String, lastName: String, nickname: String, password: String) -> Bool {
        guard !users.contains(where: { $0.nickname.lowercased() == nickname.lowercased() }) else {
            return false // nickname taken
        }
        let newUser = User(firstName: firstName, lastName: lastName, nickname: nickname, password: password)
        users.append(newUser)
        saveUsers()
        return true
    }
    
    func login(nickname: String, password: String) -> Bool {
        if let user = users.first(where: { $0.nickname.lowercased() == nickname.lowercased() && $0.password == password }) {
            currentUser = user
            saveCurrentUser()
            return true
        }
        return false
    }
    
    func logout() {
        currentUser = nil
        UserDefaults.standard.removeObject(forKey: currentUserKey)
    }
    
    // Update current user data (e.g., TODO list or homework)
    func updateCurrentUser(user: User) {
        guard let index = users.firstIndex(where: { $0.id == user.id }) else { return }
        users[index] = user
        currentUser = user
        saveUsers()
        saveCurrentUser()
    }
}
