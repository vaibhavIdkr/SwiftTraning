//
//  AddNewTaskViewController.swift
//  SwiftTraning
//
//  Created by Vaibhav T. Indalkar on 24/11/17.
//  Copyright © 2017 Vaibhav Indalkar. All rights reserved.
//

import UIKit

class AddNewTaskViewController: UIViewController {

    @IBOutlet weak var addTaskButton: UIButton!
    @IBOutlet weak var dismissVCButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addButtonShadow()
    }
    
    func addButtonShadow(){
        
        addTaskButton.layer.shadowColor = UIColor(red: 246/255.0, green: 70/255.0, blue: 85/255.0, alpha:0.7).cgColor
        addTaskButton.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        addTaskButton.layer.shadowOpacity = 1.0
        addTaskButton.layer.shadowRadius = 4.0
    }
    
    @IBAction func onDismissViewControllerButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion:nil)
    }
    
    @IBAction func onAddTaskButtonTapped(_ sender: Any) {
        
    }
}
