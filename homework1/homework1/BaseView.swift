import SwiftUI

struct BaseView: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Team Avatar")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(.indigo)

            Image("korra")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 120)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.indigo, lineWidth: 3))

            Text("Korra")
                .font(.title2)
                .foregroundColor(.secondary)

            NavigationLink("View Profile") {
                DetailsView()
            }
            .buttonStyle(.borderedProminent)
            .tint(.indigo)
        }
        .padding()
        .navigationTitle("Character Overview")
    }
}
