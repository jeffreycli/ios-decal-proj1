//
//  ToDoTaskTableViewController.swift
//  ios-decal-proj1
//
//  Created by Jeffrey Li on 10/19/16.
//  Copyright © 2016 Jeffrey Li. All rights reserved.
//

import UIKit


class ToDoTaskTableViewController: UITableViewController, AddTaskToViewControllerDelegate {
    var taskName: String?
    var taskDetail: String?
    var taskList: [ToDoItem] = []
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "To Do List"
        self.tableView.backgroundColor = UIColor.white
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTaskButtonPressed))
        
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Stats", style: .plain, target: self, action: #selector(statsButtonPressed))
        
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(isCompleted), userInfo: nil, repeats: true)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    func isCompleted() {
        for (index, task) in taskList.enumerated() {
            if task.isCompleted() {
                let currentTime = NSDate()
                if currentTime.timeIntervalSince(task.dateCompleted as! Date) > 86400 {
                    taskList.remove(at: index)
                    self.tableView.deleteRows(at: [IndexPath(row: index, section: 0)], with: .none)
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    func addTaskButtonPressed(sender: UIControlEvents) {
        let addItemVC = AddItemViewController()
        addItemVC.delegate = self
        self.navigationController?.pushViewController(addItemVC, animated: true)
    }
    
    
    func statsButtonPressed() {
        let statsVC = StatsViewController(numberOfCompletedTasks: taskCompleteCount())
        self.navigationController?.pushViewController(statsVC, animated: true)
    }
    
    
    func taskCompleteCount() -> Int {
        var count = 0
        for toDoItem in taskList{
            if toDoItem.isCompleted() == true {
                count += 1
            }
        }
        return count
    }
    
    
    func userCreatedNewTask(taskName: String, taskDetail: String) {
        let toDoItem = ToDoItem(title: taskName, detail: taskDetail)
        taskList.append(toDoItem)
        self.tableView.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return taskList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tempTask = taskList[indexPath.row]
        let cell: ToDoTaskTableViewCell = ToDoTaskTableViewCell(style: .subtitle, reuseIdentifier: "test", toDoItem: tempTask)
        cell.textLabel?.text = tempTask.taskTitle
        cell.detailTextLabel?.text = tempTask.taskDetail
        
        
        if tempTask.isCompleted() {
            cell.imageView?.image = UIImage(named: "Green Checkmark.png")
        } else {
            cell.imageView?.image = UIImage(named: "Black Checkmark.png")
        }
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tempTask = taskList[indexPath.row]
        let cell = self.tableView.cellForRow(at: indexPath)
        if tempTask.isCompleted() == false {
            tempTask.completed = true
            tempTask.startTime()
            cell?.imageView?.image = UIImage(named: "Green Checkmark.png")
        } else {
            tempTask.completed = false
            cell?.imageView?.image = UIImage(named: "Black Checkmark.png")
        }
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            taskList.remove(at: indexPath.row)
            self.tableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

 

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
