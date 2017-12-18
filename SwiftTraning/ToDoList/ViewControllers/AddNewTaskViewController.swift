//
//  AddNewTaskViewController.swift
//  SwiftTraning
//
//  Created by Vaibhav T. Indalkar on 24/11/17.
//  Copyright © 2017 Vaibhav Indalkar. All rights reserved.
//

import UIKit

class AddNewTaskViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var taskCategoryTextField: UITextField!
    @IBOutlet weak var taskDescriptionTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var addTaskButton: UIButton!
    @IBOutlet weak var taskView: UIView!
    
    let pickderViewDataSource = TimePickerDataSource()
    let toDoViewModel = ToDoViewModel()
    
    
    //MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
                
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd , yyyy";
        
        if let currentDate = Date().dateWithFormatter(formatter: formatter) {
            self.dateTextField.text = currentDate
        }
    }
    
    func setupUI() {
        
        UIApplication.shared.isStatusBarHidden = true

        self.addShadow(shadowView: addTaskButton)
        self.addShadow(shadowView: taskView)
        
        let gradientLayer = toDoViewModel.gradientLayer(shouldBeHorizontal: false)
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        self.taskCategoryTextField.rightView    = toDoViewModel.imageViewWithImage(image: #imageLiteral(resourceName: "rightArrow"))
        self.taskCategoryTextField.rightViewMode = .always
        self.timeTextField.rightView         = toDoViewModel.imageViewWithImage(image: #imageLiteral(resourceName: "rightArrow"))
        self.timeTextField.rightViewMode     = .always
    }
    
    func addShadow(shadowView:UIView) -> (){
    
        shadowView.layer.shadowColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha:0.3).cgColor
        shadowView.layer.shadowOffset = CGSize(width: 2.0, height: 5.0)
        shadowView.layer.shadowOpacity = 1.0
        shadowView.layer.shadowRadius = 4.0
    }
    
    //MARK: - Delegates
    //MARK:  Textfield
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if textField == timeTextField {
            let timePickerVC = TimePickerViewController.init(nibName: "TimePickerViewController", bundle: nil)
            
            timePickerVC.didPickTimeForReminderCallback = { hours,minutes in
                
                self.timeTextField.text = "\(hours):\(minutes)"
            }
            self.present(timePickerVC, animated: true, completion: nil)
        }
        
        return true
    }
    
    //MARK: - Button action
    @IBAction func onAddTaskButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func onDismissViewControllerButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion:nil)
    }
    
   
}
