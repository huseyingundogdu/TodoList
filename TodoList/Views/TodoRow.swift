//
//  TodoRow.swift
//  TodoList
//
//  Created by Huseyin on 12/09/2024.
//

import SwiftUI

struct TodoRow: View {
    let todo: Todo
    
    
    var body: some View {
        HStack {
            Image(systemName: "circle.fill")
                .foregroundStyle(circleColor(todo: todo))
            VStack(alignment: .leading) {
                Text(todo.title)
                    .font(.headline)
                Text(todo.desc)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(.min)
            }
            Spacer()
            Divider()
            Text(todo.priorityValue.formatted())
            Divider()
            Text(todo.goalDate, format: .dateTime.day().month())
        }
    }
    
    
    private func circleColor(todo: Todo) -> Color {
        if todo.isDone {
            return Color.done
        }
        switch todo.priorityValue {
        case 1:
            return Color.priority1
        case 2:
            return Color.priority2
        case 3:
            return Color.priority3
        default:
            return Color.done
        }
    }
}

#Preview {
    let preview = Preview(Todo.self)
    return TodoRow(todo: Todo.sampleTodos[0])
        .modelContainer(preview.container)
}

