

import SwiftUI
struct User: Codable, Identifiable, Equatable {
    var id = UUID()
    var firstName: String
    var lastName: String
    var nickname: String
    var password: String
    
    var lastHomework: String = "No homework yet"
    var todoList: [String] = []
}
