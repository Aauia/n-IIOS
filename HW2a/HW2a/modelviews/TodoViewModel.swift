import Foundation
import SwiftUI

class TodoViewModel: ObservableObject {
    @Published var todos: [TodoModel] = []
    @Published var newTodoTitle: String = ""
    @Published var selectedDueDate: Date = Date()
    @Published var isSettingDeadline: Bool = false


    func addTodo() {
        guard !newTodoTitle.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        let newTodo = TodoModel(title: newTodoTitle, dueDate: isSettingDeadline ? selectedDueDate : nil)
        todos.append(newTodo)
        newTodoTitle = ""
        isSettingDeadline = false
        selectedDueDate = Date()
    }

    func deleteTodo(_ todo: TodoModel) {
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            todos.remove(at: index)
        }
    }
    func removeTodo(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
    }

    func toggleTodo(_ todo: TodoModel) {
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            todos[index].isCompleted.toggle()
        }
    }
}
