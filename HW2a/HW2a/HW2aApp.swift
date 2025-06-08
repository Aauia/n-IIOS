import SwiftUI

@main
struct HW2aApp: App {
    @StateObject private var userManager = Manager()
    
    var body: some Scene {
        WindowGroup {
            ContentView(userManager: userManager)
        }
    }
}
