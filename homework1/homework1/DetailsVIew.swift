import SwiftUI

struct DetailsView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .indigo], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Image("korra") 
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)

                Text("Korra - The Avatar")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text("Korra is the brave and powerful Avatar from the Southern Water Tribe. Skilled in all four elements, she brings balance to the world while facing intense spiritual and political conflicts.")
                    .padding()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white.opacity(0.9))

                Button(action: {
                    dismiss()
                }) {
                    Text("Go Back")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color.white)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationTitle("Avatar Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}
