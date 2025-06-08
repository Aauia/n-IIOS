import SwiftUI

struct BarView: View {
    @ObservedObject var userManager: Manager
    
    var body: some View {
        TabView {
            HomeView(userManager: userManager)
                .tabItem {
                    Label("Home", systemImage: "list.bullet")
                }
            
            ProfileView(userManager: userManager)
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}
