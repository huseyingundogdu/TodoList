//
//  ContentView.swift
//  TodoList
//
//  Created by Huseyin on 11/09/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: [.init(\Todo.priorityValue, order: .reverse)],
           animation: .bouncy)
    private var allTodos: [Todo]    
    
    @State private var isShowingTodoAddSheet = false
    @State private var currentSegment: SegmentState = .all
    enum SegmentState {
        case all
        case done
        case notDone
    }
    
    var filteredTodos: [Todo] {
        switch currentSegment {
        case .all:
            return allTodos
        case .done:
            return allTodos.filter { $0.isDone }
        case .notDone:
            return allTodos.filter { !$0.isDone }
        }
    }
    
    var body: some View {
        NavigationStack {
            
            VStack {
                Picker("Todos", selection: $currentSegment) {
                    Text("All Todos").tag(SegmentState.all)
                    Text("Done Todos").tag(SegmentState.done)
                    Text("Not Done Todos").tag(SegmentState.notDone)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                
                List {
                    ForEach(filteredTodos) { todo in
                        NavigationLink {
                            TodoDetailView(todo: todo)
                        } label: {
                            TodoRow(todo: todo)
                        }
                    }
                    .onDelete(perform: deleteTodo)
                }
            }
            .navigationTitle("Todo App")
            .sheet(isPresented: $isShowingTodoAddSheet) { TodoAddSheetView() }
            .toolbar {
                ToolbarItem {
                    Button("Add Todo", systemImage: "plus") {
                        isShowingTodoAddSheet.toggle()
                    }
                }
            }
        }
    }
    
    private func deleteTodo(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(allTodos[index])
            }
        }
    }
}

#Preview {
    let preview = Preview(Todo.self)
    preview.addExamples(Todo.sampleTodos)
    return ContentView()
        .modelContainer(preview.container)
}
