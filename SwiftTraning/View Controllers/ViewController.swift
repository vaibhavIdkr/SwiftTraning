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
        tasksListView.delegate   = tableDataSource

        tableDataSource.selectedTaskCallback = { taskName in            
            
            var taskList:[String] = TasksDataSource().allTasks()
            
            switch taskName {
            case taskList[0]:
                if let toDoListVC = self.storyboard?.instantiateViewController(withIdentifier: "todoListVC"){
                    self.navigationController?.pushViewController(toDoListVC, animated: true)
                }
            default:
                if let defaultVC = self.storyboard?.instantiateViewController(withIdentifier: "defaultTask"){
                    self.navigationController?.pushViewController(defaultVC, animated: true)
                }
            }
        }
    }
    
}


