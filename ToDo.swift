//
//  ToDo.swift
//  ToDoList (version2)
//
//  Created by Левиафан on 2024-05-29.
//

import Foundation

class Todo {
    var name: String
    var isCompleted: Bool
    var id: UUID
    
    init(name: String, isCompleted: Bool, id: UUID = UUID()) {
        self.name = name
        self.isCompleted = isCompleted
        self.id = id
    }
    
}
