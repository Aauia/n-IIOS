import SwiftUI

struct UserSessionMVVMApp: App {
    @StateObject private var userManager = Manager()
    
    var body: some Scene {
        WindowGroup {
            ContentView(userManager: userManager)
        }
    }
}
