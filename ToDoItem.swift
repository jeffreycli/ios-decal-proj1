//
//  ToDoTask.swift
//  ios-decal-proj1
//
//  Created by Jeffrey Li on 10/19/16.
//  Copyright © 2016 Jeffrey Li. All rights reserved.
//

import UIKit

class ToDoItem: NSObject {
    var taskTitle: String?
    var taskDetail: String?
    var completed: Bool
    var dateCompleted: NSDate? = nil
    
    init(title: String, detail: String) {
        self.taskTitle = title
        self.taskDetail = detail
        self.completed = false
    }
    
    func isCompleted() -> Bool {
        return completed
    }
    
    func startTime() {
        dateCompleted = NSDate()
    }
}
