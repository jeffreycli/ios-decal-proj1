//
//  ViewController.swift
//  ios-decal-proj1
//
//  Created by Jeffrey Li on 10/17/16.
//  Copyright © 2016 Jeffrey Li. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "To Do List"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTaskPressed))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Stats", style: .plain, target: self, action: #selector(statsPressed))
    }

    func addTaskPressed() {
        let addItemVC = AddItemViewController()
        self.navigationController?.pushViewController(addItemVC, animated: true)
    }
    
    func statsPressed() {
        let statsVC = StatsViewController()
        self.navigationController?.pushViewController(statsVC, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

