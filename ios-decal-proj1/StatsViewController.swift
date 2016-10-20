//
//  StatsViewController.swift
//  ios-decal-proj1
//
//  Created by Jeffrey Li on 10/17/16.
//  Copyright © 2016 Jeffrey Li. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    let completedTitle = UILabel()
    let taskDailyCompletionCount = UILabel()
    

    convenience init(numberOfCompletedTasks: Int) {
        self.init()
        self.taskDailyCompletionCount.text = String(numberOfCompletedTasks)
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Daily Stats"
        
    
        //"Completed" Title properties
        self.view.addSubview(completedTitle)
        self.completedTitle.textAlignment = .center
        self.completedTitle.text = "Completed"
        self.completedTitle.font = UIFont.boldSystemFont(ofSize: 28)
        self.completedTitle.translatesAutoresizingMaskIntoConstraints = false
        self.completedTitle.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.completedTitle.widthAnchor.constraint(equalToConstant: 300).isActive = true
        self.completedTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.completedTitle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: UIScreen.main.bounds.height/2-70).isActive = true

        
        
        //Daily Completed Task Count properties
        self.view.addSubview(taskDailyCompletionCount)
        self.taskDailyCompletionCount.adjustsFontSizeToFitWidth = true
        self.taskDailyCompletionCount.textAlignment = .center
        self.taskDailyCompletionCount.font = UIFont.boldSystemFont(ofSize: 44)
        self.taskDailyCompletionCount.translatesAutoresizingMaskIntoConstraints = false
        self.taskDailyCompletionCount.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.taskDailyCompletionCount.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.taskDailyCompletionCount.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.taskDailyCompletionCount.widthAnchor.constraint(equalToConstant: 200).isActive = true
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
