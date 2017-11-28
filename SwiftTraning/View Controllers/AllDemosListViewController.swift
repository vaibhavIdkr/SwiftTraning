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
    var toDoModelInstance = ToDoViewModel()
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Swift Demo's"
        UIApplication.shared.isStatusBarHidden = false;
        
        self.demoListTableView.delegate = tableDataSource
        self.demoListTableView.dataSource = tableDataSource
        
        tableDataSource.selectedTaskCallback = { selectedDemo in
            
            var taskList:[String] = TasksDataSource().allTasks()
            
            switch selectedDemo {
            case taskList[0]:
        
                let toDoListVC = ToDoListViewController.init(nibName: "ToDoListViewController", bundle: nil)
                UIView.animate(withDuration: 0.75, animations: {
                    
                    let transition = self.toDoModelInstance.pushPopTransationAnimation()                    
                    UIView.setAnimationCurve(.easeInOut)
                    self.navigationController?.view.layer.add(transition, forKey: kCATransition)
                    self.navigationController?.pushViewController(toDoListVC, animated: false)
                    //UIView.setAnimationTransition(.flipFromRight, for: (self.navigationController?.view)!, cache: false)
                })
                
                break;
            default:
                break;
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false;
    }
}
