//
//  TodoSamples.swift
//  TodoList
//
//  Created by Huseyin on 13/09/2024.
//

import Foundation


extension Todo {
    static var sampleTodos: [Todo] = [
        Todo(
            title: "Buy groceries",
            desc: "Get milk, eggs, and bread",
            priorityValue: 1,
            creationDate: Date(),
            goalDate: Calendar.current.date(byAdding: .day, value: 1, to: Date())!,
            isDone: false
        ),
        Todo(
            title: "Finish SwiftUI project",
            desc: "Work on the new SwiftUI app features",
            priorityValue: 2,
            creationDate: Date(),
            goalDate: Calendar.current.date(byAdding: .day, value: 3, to: Date())!,
            isDone: false
        ),
        Todo(
            title: "Call Mom",
            desc: "Catch up with Mom on the weekend",
            priorityValue: 3,
            creationDate: Date(),
            goalDate: Calendar.current.date(byAdding: .day, value: 2, to: Date())!,
            isDone: false
        ),
        Todo(
            title: "Read a book",
            desc: "Finish the last chapter of 'Atomic Habits'",
            priorityValue: 1,
            creationDate: Date(),
            goalDate: Calendar.current.date(byAdding: .day, value: 7, to: Date())!,
            isDone: false
        ),
        Todo(
            title: "Workout",
            desc: "Complete a 30-minute cardio session",
            priorityValue: 2,
            creationDate: Date(),
            goalDate: Calendar.current.date(byAdding: .day, value: 1, to: Date())!,
            isDone: false
        )
    ]
}
