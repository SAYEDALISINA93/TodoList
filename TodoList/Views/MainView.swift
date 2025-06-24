//
//  ContentView.swift
//  TodoList
//
//  Created by Alisina on 23.06.25.
//

import SwiftUI

struct MainView: View {
    
    @State private var tasks: [TaskModel] = []
    @State private var taskToEdit: TaskModel?
    
    var body: some View {
        NavigationStack{
            ZStack {
                VStack(alignment: .leading, spacing: 0) {
                    List {
                        ForEach(tasks) { task in
                            Button(action: {
                                
                                guard let index = tasks.firstIndex(of: task) else {
                                    return
                                }
                                
                                tasks[index].isCompleted.toggle()
                            }, label: {
                                TaskViewView(task: task)
                                    .foregroundStyle(.black)
                            })
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .navigationTitle("Tasks")
                    .toolbar {
                        NavigationLink {
                            AddNewTaskTodo(tasks: $tasks)
                        } label: {
                            Text("+")
                                .font(.system(size: 35, weight: .regular, design: .default))
                                .foregroundStyle(Color.black)
                        }
                    }
                }
                .background(Color.gray.opacity(0.08))
            }
        }
    }
}

#Preview {
    MainView()
}
