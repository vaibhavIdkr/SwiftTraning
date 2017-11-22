//
//  ToDoListViewController.swift
//  SwiftTraning
//
//  Created by Vaibhav T. Indalkar on 21/11/17.
//  Copyright © 2017 Vaibhav Indalkar. All rights reserved.
//

import UIKit

class ToDoListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Task Listing"
        
        self.configureNavigationToolBar()
    }

    func configureNavigationToolBar(){
        
        let addBarButton = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector (pushAddTaskViewController))
        
        self.navigationController?.navigationItem.backBarButtonItem?.title = "<"
        self.navigationController?.navigationItem.rightBarButtonItem = addBarButton
    }
    
    @objc func pushAddTaskViewController(){
        
    }
}
