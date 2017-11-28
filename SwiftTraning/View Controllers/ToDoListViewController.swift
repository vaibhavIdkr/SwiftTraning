//
//  ToDoListViewController.swift
//  SwiftTraning
//
//  Created by Vaibhav T. Indalkar on 23/11/17.
//  Copyright © 2017 Vaibhav Indalkar. All rights reserved.
//

import UIKit

class ToDoListViewController: UIViewController{

    var reuseIdentifier = "collectionCell"
    let toDoViewModelInstance = ToDoViewModel()
    
    var dateCollectionViewDataSource   = DateCollectionViewDataSource.init(cellIdentifier: "collectionCell")
    override var prefersStatusBarHidden: Bool{
        return false
    }
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dayOfWeekLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var calenderCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Things To-DO"
    
        self.calenderCollectionView.dataSource      = dateCollectionViewDataSource
        self.calenderCollectionView.backgroundColor = UIColor.clear
        self.calenderCollectionView.register(UINib.init(nibName: "DateColleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)

        self.navigationController?.isNavigationBarHidden = true;
        self.setDateLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIApplication.shared.isStatusBarHidden = false;
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if let currentDate = dateCollectionViewDataSource.currentDayOfMonth {
            let newIndexPath:IndexPath = IndexPath.init(row: currentDate, section: 0);
            self.calenderCollectionView .scrollToItem(at: newIndexPath, at: .left, animated: true)
        }
    }
    
    func setDateLabels() {
        
        if let dateString = toDoViewModelInstance.stringFromDate(){
             self.dateLabel.text = dateString
        }
        if let dayOfWeek = toDoViewModelInstance.dayOfWeekFromDate() {
            self.dayOfWeekLabel.text = dayOfWeek
        }
        if let month = toDoViewModelInstance.combinedMonthYearFromDate(){
            self.monthLabel.text = month
        }
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        
        let animationTransition = toDoViewModelInstance.pushPopTransationAnimation()
        self.navigationController?.view.layer .add(animationTransition, forKey: kCATransition)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func presentAddToDoTaskViewController(_ sender: Any) {
        let newTaskVC = AddNewTaskViewController.init(nibName: "AddNewTaskViewController", bundle: nil)
        newTaskVC.modalPresentationStyle = .currentContext
        newTaskVC.modalTransitionStyle   = .crossDissolve
        self.present(newTaskVC, animated: true, completion: nil)
    }
}
