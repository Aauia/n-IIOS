import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(Color.indigo)
                .ignoresSafeArea()

            VStack(spacing: 30) {
                Text("Welcome to the Profile App")
                    .font(.title)
                    .foregroundColor(.white)

                NavigationLink("Go to User Profile") {
                    BaseView()
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
}
