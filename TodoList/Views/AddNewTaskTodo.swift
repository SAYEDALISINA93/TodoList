//
//  AddNewTaskTodo.swift
//  TodoList
//
//  Created by Alisina on 23.06.25.
//

import SwiftUI

struct AddNewTaskTodo: View {
    
    @State private var taskTitle: String = ""
    @State private var selectPriority: TaskPriorityModel = .normal
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    @State private var showAlert: Bool = false
    
    @Binding var tasks: [TaskModel]
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading) {
                Text("Task Title")
                    .font(.system(size: 20, weight: .bold))
                TextField("Enter task title", text: $taskTitle)
                    .font(.system(size: 15))
                    .textFieldStyle(.roundedBorder)

                Text("Priority")
                    .font(.system(size: 20, weight: .bold))
                    .padding(.top)
                Picker("Choose task priority", selection: $selectPriority) {
                    ForEach(TaskPriorityModel.allCases){ taskPriority in
                        Text(taskPriority.taskPriority).tag(taskPriority)
                        
                    }
                }
                Button {
                    print("Hi")
                    
                    guard !taskTitle.isEmpty else {
                        alertTitle = "Empty Title"
                        alertMessage = "Please add a tite for your task!"
                        showAlert = true
                        return
                    }
                    
                    let task = TaskModel(title: taskTitle, priority: selectPriority, isCompleted: false)
                    
                    tasks.append(task)
                    
                    dismiss()
                    
                } label: {
                    Text("Add Task")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.white)
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                }

            }
            .padding(.horizontal, 30)
            .padding(.top)
            .alert(alertTitle, isPresented: $showAlert) {
                Button("OK") {
                    self.showAlert = false
                }
            } message: {
                Text(alertMessage)
            }

            
        }
        Spacer()
    }
}

#Preview {
    AddNewTaskTodo(tasks: .constant([]))
}
