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
    
    @IBOutlet weak var calenderCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Things To-DO"
    
        self.calenderCollectionView.dataSource      = dateCollectionViewDataSource
        self.calenderCollectionView.backgroundColor = UIColor.clear
        self.calenderCollectionView.register(UINib.init(nibName: "DateColleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
        self.navigationController?.isNavigationBarHidden = true;
        
    }

    @IBAction func presentAddToDoTaskViewController(_ sender: Any) {
        
    }

}
