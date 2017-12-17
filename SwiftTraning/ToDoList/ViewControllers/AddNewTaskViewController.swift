//
//  AddNewTaskViewController.swift
//  SwiftTraning
//
//  Created by Vaibhav T. Indalkar on 24/11/17.
//  Copyright © 2017 Vaibhav Indalkar. All rights reserved.
//

import UIKit

class AddNewTaskViewController: UIViewController {

    @IBOutlet weak var timePickerView: UIPickerView!
    @IBOutlet weak var additionalNotesTextView: UITextView!
    @IBOutlet weak var shouldRemindSwitch: UISwitch!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var addTaskButton: UIButton!
    @IBOutlet weak var taskView: UIView!
    
    let toDoViewModel = ToDoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd , yyyy";
        
        if let currentDate = Date().dateWithFormatter(formatter: formatter) {
            self.dateLabel.text = currentDate
        }
    }
    
    func setupUI() {
        
        UIApplication.shared.isStatusBarHidden = true
        
        self.addShadow(shadowView: addTaskButton)
        self.addShadow(shadowView: taskView)
        
        let scale = CGAffineTransform.init(scaleX:0.7, y: 0.7)
        shouldRemindSwitch.transform = scale;
        
        let gradientLayer = toDoViewModel.gradientLayer(shouldBeHorizontal: false)
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
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
