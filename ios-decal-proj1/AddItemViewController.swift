//
//  AddItemViewController.swift
//  ios-decal-proj1
//
//  Created by Jeffrey Li on 10/17/16.
//  Copyright © 2016 Jeffrey Li. All rights reserved.
//

import UIKit

protocol AddTaskToViewControllerDelegate {
    func userCreatedNewTask(taskName: String, taskDetail: String)
}

class AddItemViewController: UIViewController {
    let taskName = UITextField()
    let taskDetail = UITextField()
    var delegate: AddTaskToViewControllerDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "New Todo"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(moveTask))
        
        
        //Task Name properties
        taskName.placeholder = "Task Name"
        taskName.borderStyle = .roundedRect
        self.view.addSubview(taskName)
        taskName.translatesAutoresizingMaskIntoConstraints = false
        taskName.heightAnchor.constraint(equalToConstant: 40).isActive = true
        taskName.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width - 40).isActive = true
        taskName.topAnchor.constraint(equalTo: self.view.topAnchor, constant: (self.navigationController?.navigationBar.frame.height)! + 40).isActive = true
        taskName.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        
        //Task Detail properties
        taskDetail.placeholder = "Task Details"
        taskDetail.borderStyle = .none
        self.view.addSubview(taskDetail)
        taskDetail.translatesAutoresizingMaskIntoConstraints = false
        taskDetail.heightAnchor.constraint(equalToConstant: 80).isActive = true
        taskDetail.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width - 40).isActive = true
        taskDetail.topAnchor.constraint(equalTo: taskName.bottomAnchor, constant: 20).isActive = true
        taskDetail.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
    }
    
    func moveTask(sender: UIControlEvents) {
        self.delegate?.userCreatedNewTask(taskName: taskName.text!, taskDetail: taskDetail.text!)
        self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
