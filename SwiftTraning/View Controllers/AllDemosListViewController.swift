//
//  AllDemosListViewController.swift
//  SwiftTraning
//
//  Created by Vaibhav T. Indalkar on 23/11/17.
//  Copyright © 2017 Vaibhav Indalkar. All rights reserved.
//

import UIKit

class AllDemosListViewController: UIViewController {

    @IBOutlet weak var demoListTableView: UITableView!
    var tableDataSource  = TaskListViewDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Swift Demo's"
                
        self.demoListTableView.delegate = tableDataSource
        self.demoListTableView.dataSource = tableDataSource
        
        tableDataSource.selectedTaskCallback = { selectedDemo in
            
            var taskList:[String] = TasksDataSource().allTasks()
            
            switch selectedDemo {
            case taskList[0]:
                
                
                let toDoListVC = ToDoListViewController.init(nibName: "ToDoListViewController", bundle: nil)
                self.navigationController?.pushViewController(toDoListVC, animated: true)
                
                break;
            default:
                break;
            }
        }
    }
}
