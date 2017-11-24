//
//  DateCollectionViewDataSource.swift
//  SwiftTraning
//
//  Created by Vaibhav T. Indalkar on 23/11/17.
//  Copyright © 2017 Vaibhav Indalkar. All rights reserved.
//

import UIKit

class DateCollectionViewDataSource: NSObject,UICollectionViewDataSource,UICollectionViewDelegate {

    let daysOfWeek  = ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]
    var collectionViewCompletionCallback : (()->())?
    var cellIdentifier      : String?
    var daysInCurrentMonth  : Int?
    let currentDayOfMonth   : Int?
    
    init(cellIdentifier:String) {
        self.cellIdentifier = cellIdentifier
        self.daysInCurrentMonth = Date().daysInCurrentMonth()
        self.currentDayOfMonth  = Date().currentDay()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return daysInCurrentMonth!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier!, for: indexPath) as! DateColleCollectionViewCell
       
        cell.dayLabel.text  = CalenderData().dayFromIndexPath(index: indexPath)
        cell.dateLabel.text = "\(indexPath.row + 1)";
        
        if ((indexPath.row + 1) == self.currentDayOfMonth){
            cell.dateLabel.textColor           = UIColor.init(red: 247/255.0, green: 101/255.0, blue: 105/255.0, alpha: 1)
            cell.dateLabel.backgroundColor     = UIColor.white
            cell.dateLabel.layer.masksToBounds = true
            cell.dateLabel.layer.cornerRadius  = 10.0;
        }else{
            cell.dateLabel.textColor          = UIColor.white
            cell.dateLabel.backgroundColor    = UIColor.clear
            cell.dateLabel.layer.cornerRadius = 0.0;
        }
        
        return cell;
    }
}

class CalenderData {
    
    func dayFromIndexPath(index:IndexPath) -> String {
        
        let firstDateOfMonth = Date().startOfMonth()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE";
        
        var dateComponent = DateComponents()
        dateComponent.day = index.row + 1
        let computedDate  = Calendar.current.date(byAdding: .day, value: index.row, to: firstDateOfMonth!)
        let day           = dateFormatter.string(from: computedDate!)
        
        return day;
    }
    
    func currentDayOfMonth() -> Int {
        if let currentDay = Date().currentDay(){
            return currentDay
        }else {
            return 0;
        }
    }
}

extension Date {
    
    func daysInCurrentMonth() -> Int? {
        
        let dateRange = Calendar.current.range(of: .day, in: .month, for: Date())
        let days      = dateRange?.count
        return days!
    }
    
    func currentDay() -> Int? {
        
        let dateComponent:DateComponents = Calendar.current.dateComponents([.year,.month,.day], from: self)
        return dateComponent.day!
    }
    
    func startOfMonth() -> Date? {
        
        let components:NSDateComponents = Calendar.current.dateComponents([.year,.month,], from: self) as NSDateComponents
        let componentDate = Calendar.current.date(from: components as DateComponents)
        
        return Calendar.current.date(byAdding: .day, value: 0, to: componentDate!)
    }
    
    func lastDayOfMonth() -> Date? {
        
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth()!)!
    }
}


