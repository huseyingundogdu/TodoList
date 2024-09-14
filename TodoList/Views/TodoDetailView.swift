//
//  TodoDetailView.swift
//  TodoList
//
//  Created by Huseyin on 12/09/2024.
//

import SwiftUI

struct TodoDetailView: View {
    @Bindable var todo: Todo
    
    var body: some View {
        VStack {
            Form {
                TextField("Title", text: $todo.title)
                    .font(.headline)
                    .bold()
                TextField("Description", text: $todo.desc, axis: .vertical)
                    .lineLimit(5)
                Picker("Priority", selection: $todo.priorityValue) {
                    ForEach(1...3, id: \.self) { number in
                        Text("\(number)").tag(number)
                    }
                }
                
                Toggle(todo.isDone ? "Completed" : "Not Completed", isOn: $todo.isDone)
            }
        }
    }
}


#Preview {
    let preview = Preview(Todo.self)
    return TodoDetailView(todo: Todo.sampleTodos[0])
        .modelContainer(preview.container)
}

