//
//  TodoTaskTableViewCell.swift
//  ios-decal-proj1
//
//  Created by Jeffrey Li on 10/19/16.
//  Copyright © 2016 Jeffrey Li. All rights reserved.


import UIKit

class ToDoTaskTableViewCell: UITableViewCell {
    var toDoItem: ToDoItem? = nil
    
    convenience init(style: UITableViewCellStyle, reuseIdentifier: String?, toDoItem: ToDoItem) {
        self.init(style: style, reuseIdentifier: reuseIdentifier)
        self.toDoItem = toDoItem
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
