import Foundation

struct TodoModel: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
    var dueDate: Date? = nil
}
