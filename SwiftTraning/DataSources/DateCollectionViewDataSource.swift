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
    var cellIdentifier      : String?
    var daysInCurrentMonth  : Int?
    var currentDayOfMonth   : Int?
    
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
        
        return cell;
    }

}

class CalenderData {
    
    func shuffleDaysArrayByMonth() -> [String] {
        
        let daysOfWeek:[String]  = ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]
        let firstDateOfMonth = Date().firstDayInMonth()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE";
        
        let firstDayOfMonth:String = dateFormatter.string(from:firstDateOfMonth!)
        let indexOfFirstDay = daysOfWeek.index(of: firstDayOfMonth) 
        
        return [];
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
    
    func firstDayInMonth() -> Date? {
        
        let components:NSDateComponents = Calendar.current.dateComponents([.year, .month], from: self) as NSDateComponents
        components.month += 1
        components.day = 1
        components.day -= 1
        return Calendar.current.date(from: components as DateComponents)!
    }
}


