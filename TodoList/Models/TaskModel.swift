//
//  TaskModel.swift
//  TodoList
//
//  Created by Alisina on 23.06.25.
//

import Foundation

struct TaskModel: Identifiable, Hashable, Equatable {
    let id = UUID()
    var title: String
    var priority: TaskPriorityModel
    var isCompleted: Bool
}
