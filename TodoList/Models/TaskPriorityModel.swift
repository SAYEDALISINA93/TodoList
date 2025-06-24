//
//  TaskPriorityModel.swift
//  TodoList
//
//  Created by Alisina on 23.06.25.
//

import Foundation


enum TaskPriorityModel: String, CaseIterable, Identifiable {
    
    case urgent
    case normal
    case optional
    
    var id: Self { self }
    
    var taskPriority: String {
        switch self {
        case .urgent:
            return "Urgent"
        case .normal:
            return "Normal"
        case .optional:
            return "Optional"
        }
    }
}
