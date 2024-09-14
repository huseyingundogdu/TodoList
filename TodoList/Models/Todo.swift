//
//  Todo.swift
//  TodoList
//
//  Created by Huseyin on 12/09/2024.
//

import Foundation
import SwiftData

@Model
final class Todo {
    @Attribute(.unique)
    var title: String
    var desc: String
    var priorityValue: Int
    var creationDate: Date
    var goalDate: Date
    var isDone: Bool
    
    init(title: String, desc: String, priorityValue: Int, creationDate: Date = Date.now, goalDate: Date, isDone: Bool = false) {
        self.title = title
        self.desc = desc
        self.priorityValue = priorityValue
        self.creationDate = creationDate
        self.goalDate = goalDate
        self.isDone = isDone
    }
}
