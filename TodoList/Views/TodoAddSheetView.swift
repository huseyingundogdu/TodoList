//
//  TodoAddSheetView.swift
//  TodoList
//
//  Created by Huseyin on 13/09/2024.
//

import SwiftUI

struct TodoAddSheetView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var title: String = ""
    @State private var desc: String = ""
    @State private var goalDate: Date = Date.now
    @State private var priority: Int = 1
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                    .font(.headline)
                    .bold()
                TextField("Description", text: $desc, axis: .vertical)
                    .lineLimit(3)
                Picker("Priority", selection: $priority) {
                    ForEach(1...3, id: \.self) { number in
                        Text("\(number)").tag(number)
                    }
                }
                DatePicker("Goal Date", selection: $goalDate, displayedComponents: .date)
            }
            .navigationTitle("Add new Todo")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        let todo = Todo(title: title, desc: desc, priorityValue: priority, goalDate: goalDate)
                        modelContext.insert(todo)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    let preview = Preview(Todo.self)
    return TodoAddSheetView()
        .modelContainer(preview.container)
}
