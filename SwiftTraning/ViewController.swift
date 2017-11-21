//
//  ViewController.swift
//  SwiftTraning
//
//  Created by Vaibhav Indalkar on 20/11/17.
//  Copyright © 2017 Vaibhav Indalkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    var tableDataSource = TaskListViewDataSource()
    
    @IBOutlet weak var tasksListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasksListView.dataSource = tableDataSource
    }

}


