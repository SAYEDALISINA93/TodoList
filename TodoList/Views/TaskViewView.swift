//
//  TransactionView.swift
//  TodoList
//
//  Created by Alisina on 23.06.25.
//

import SwiftUI

struct TaskViewView: View {
    let task: TaskModel
    var body: some View {
            HStack{
                Image(uiImage: task.isCompleted ? .checkmark : .strokedCheckmark)

                Text(task.title)
                Spacer()
                switch task.priority {
                case .urgent:
                        Text(task.priority.taskPriority)
                            .padding(5)
                            .foregroundColor(.red)
                            .background(Color.red.opacity(0.3).clipShape(Capsule()))
                            .font(.system(size: 15))
                case .normal:
                    Text(task.priority.taskPriority)
                        .foregroundColor(.green)
                            .padding(5)
                            .background(
                                Color.green.opacity(0.3)
                                    .clipShape(Capsule())
                            )
                            .font(.system(size: 15))
                    
                case .optional:
                    Text(task.priority.taskPriority)
                        .font(.system(size: 15, weight: .bold))
                        .padding(5)
                        .foregroundColor(.blue)
                        .background(Color.blue.opacity(0.1)
                            .clipShape(Capsule()))
                }
            }
        
    }
}

#Preview {
    TaskViewView(task: TaskModel(title: "Study", priority: .optional, isCompleted: true))
}
