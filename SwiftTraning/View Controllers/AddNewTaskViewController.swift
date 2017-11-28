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
    @IBOutlet weak var taskView: UIView!
    let toDoViewModel = ToDoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.isStatusBarHidden = true
        self.addButtonShadow()
        self.addShadow(shadowView: taskView)
        
        let gradientLayer = toDoViewModel.gradientLayer(shouldBeHorizontal: false)
        gradientLayer.frame = (UIApplication.shared.keyWindow?.frame)!
        self.view.layer.addSublayer(gradientLayer)
    }
    
    func addButtonShadow(){
        
        addTaskButton.layer.shadowColor = UIColor(red: 73/255.0, green: 67/255.0, blue: 134/255.0, alpha:0.7).cgColor
        addTaskButton.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        addTaskButton.layer.shadowOpacity = 1.0
        addTaskButton.layer.shadowRadius = 4.0
    }
    
    func addShadow(shadowView:UIView) -> (){
    
        shadowView.layer.shadowColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha:0.3).cgColor
        shadowView.layer.shadowOffset = CGSize(width: 2.0, height: 5.0)
        shadowView.layer.shadowOpacity = 1.0
        shadowView.layer.shadowRadius = 4.0
    }
    
    @IBAction func onDismissViewControllerButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion:nil)
    }
    
    @IBAction func onAddTaskButtonTapped(_ sender: Any) {
        
    }
}
