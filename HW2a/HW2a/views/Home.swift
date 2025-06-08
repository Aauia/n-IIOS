import SwiftUI

struct HomeView: View {
    @ObservedObject var userManager: Manager
    @State private var newTodo = ""
    
    var body: some View {
        VStack {
            Text("Hello, \(userManager.currentUser?.firstName ?? "User")!")
                .font(.headline)
                .padding()
            
            List {
                ForEach(userManager.currentUser?.todoList ?? [], id: \.self) { todo in
                    Text(todo)
                }
                .onDelete(perform: deleteTodos)
            }
            
            HStack {
                TextField("New ToDo", text: $newTodo)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Add") {
                    addTodo()
                }
                .disabled(newTodo.isEmpty)
            }
            .padding()
        }
        .navigationTitle("TODO List")
    }
    
    func addTodo() {
        guard var user = userManager.currentUser else { return }
        user.todoList.append(newTodo)
        newTodo = ""
        userManager.updateCurrentUser(user: user)
    }
    
    func deleteTodos(at offsets: IndexSet) {
        guard var user = userManager.currentUser else { return }
        user.todoList.remove(atOffsets: offsets)
        userManager.updateCurrentUser(user: user)
    }
}


