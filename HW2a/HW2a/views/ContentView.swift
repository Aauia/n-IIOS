import SwiftUI

struct ContentView: View {
    @ObservedObject var userManager: Manager
    
    var body: some View {
        NavigationView {
            if userManager.currentUser == nil {
                LoginView(userManager: userManager)
            } else {
                BarView(userManager: userManager)
            }
        }
        .animation(.default, value: userManager.currentUser)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(userManager: Manager())
    }
}
