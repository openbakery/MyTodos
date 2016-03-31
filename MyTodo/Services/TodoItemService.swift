//
//  TodoItemService.swift
//  MyTodo
//
//  Created by Workshop on 09/03/16.
//  Copyright © 2016 Rene Pirringer. All rights reserved.
//

import Foundation

class TodoItemService: NSObject {
    
    static let NotFound = -1

    private(set) var todoItems = [TodoItem]()
    
    static var identifier = 0

    
    func addTodoItem(item: TodoItem) -> TodoItem {
        TodoItemService.identifier = TodoItemService.identifier + 1
        let addedTodoItem = TodoItem(identifier:TodoItemService.identifier, title:item.title, done:item.done)
        self.todoItems.append(addedTodoItem)
        return addedTodoItem
    }
    
    func saveTodoItem(item: TodoItem) -> TodoItem {
        let index = indexOfTodoItem(item)
        if (index != TodoItemService.NotFound) {
            todoItems[index] = item
        }
        return item
    }
    
    func removeItem(item: TodoItem) -> TodoItem? {
        let index = indexOfTodoItem(item)
        if (index != TodoItemService.NotFound) {
            return todoItems.removeAtIndex(index)
        }
        return nil
    }
    
    private func indexOfTodoItem(item: TodoItem) -> Int {
        for (index, element) in todoItems.enumerate() {
            if (element.identifier == item.identifier) {
                return index
            }
        }
        return TodoItemService.NotFound
    }


    
    
}
