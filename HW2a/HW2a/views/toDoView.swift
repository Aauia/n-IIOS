import SwiftUI



struct ToDoView: View {
    @StateObject private var viewModel = TodoViewModel()

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                        TextField("Enter todo", text: $viewModel.newTodoTitle)
                            .textFieldStyle(RoundedBorderTextFieldStyle())

                        Button(action: viewModel.addTodo) {
                            Image(systemName: "plus.circle.fill")
                                .font(.title)
                        }
                    }
                    .padding(.horizontal)

                    Toggle("Set deadline", isOn: $viewModel.isSettingDeadline)
                        .padding(.horizontal)

                    if viewModel.isSettingDeadline {
                        DatePicker("Select due date", selection: $viewModel.selectedDueDate, displayedComponents: .date)
                            .datePickerStyle(.compact)
                            .padding(.horizontal)
                    }

                List {
                    ForEach(viewModel.todos) { todo in
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(todo.isCompleted ? .green : .gray)
                                    .onTapGesture {
                                        viewModel.toggleTodo(todo)
                                    }

                                Text(todo.title)
                                    .strikethrough(todo.isCompleted)

                                Spacer()

                                Button(action: {
                                    viewModel.deleteTodo(todo)
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                            }

                            if let due = todo.dueDate {
                                Text("Due: \(due.formatted(date: .abbreviated, time: .omitted))")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .padding(.leading, 30)
                            }
                        }
                        .padding(.vertical, 4)
                    }

                }
            }
            .navigationTitle("Todo List")
        }
    }
}



