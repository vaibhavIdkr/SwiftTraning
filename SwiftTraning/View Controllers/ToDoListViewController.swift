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
    var dateCollectionViewDataSource   = DateCollectionViewDataSource.init(cellIdentifier: "collectionCell")
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let currentDate = dateCollectionViewDataSource.currentDayOfMonth {
            let newIndexPath:IndexPath = IndexPath.init(row: currentDate, section: 0);
            self.calenderCollectionView .scrollToItem(at: newIndexPath, at: .left, animated: true)
        }
    }
    
    func setDateLabels() {
        
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        self.dateLabel.text = dateFormatter.string(from: currentDate)
        
        dateFormatter.dateFormat = "EEEE"
        self.dayOfWeekLabel.text = dateFormatter.string(from: currentDate)
        
        dateFormatter.dateFormat = "yyyy"
        let year                 = dateFormatter.string(from: currentDate)
        
        dateFormatter.dateFormat = "MMM"
        self.monthLabel.text     = "\(dateFormatter.string(from: currentDate),year)"
    }
    
    @IBAction func presentAddToDoTaskViewController(_ sender: Any) {
        
    }

}
