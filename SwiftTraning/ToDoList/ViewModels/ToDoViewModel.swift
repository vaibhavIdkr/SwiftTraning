//
//  ToDoViewModel.swift
//  SwiftTraning
//
//  Created by Vaibhav T. Indalkar on 28/11/17.
//  Copyright © 2017 Vaibhav Indalkar. All rights reserved.
//

import UIKit

struct ToDoTask {
    var taskName : String?
    var additionalNore : String?
    var scheduleDate : Date?
}

class ToDoViewModel: NSObject {
    
    func currentDayOfMonth() -> Int? {
        return Date().currentDay()
    }
    
    func numberOfDaysInMonth() -> Int? {
        return Date().daysInCurrentMonth()
    }
    
    func pushPopTransationAnimation() -> (CATransition){
        
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionFade
        return transition
    }
    
    func gradientLayer(shouldBeHorizontal:Bool) -> CAGradientLayer {
        
        let topColor    = UIColor.init(red: 140/255.0, green: 85/255.0, blue: 191/255.0, alpha: 1).cgColor
        let middleColor = UIColor.init(red: 205/255.0, green: 41/255.0, blue: 139/255.0, alpha: 1).cgColor
        let bottomColor = UIColor.init(red: 234/255.0, green: 29/255.0, blue: 118/255.0, alpha: 0.6).cgColor
        let colors = [topColor,middleColor,bottomColor]
        
        let gradientLayer = CAGradientLayer().layerWithColor(colors: colors, shouldBeHorizontal: shouldBeHorizontal)
        return gradientLayer
    }
    
    func stringFromDate() -> String? {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: currentDate)
    }
    
    func dayOfWeekFromDate() -> String? {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: currentDate)
    }
    
    func yearFromDate() -> String? {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: currentDate)
    }
    
    func combinedMonthYearFromDate() -> String? {
        if let currentYear = yearFromDate(){
            let currentDate = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM"
            
            let newDate = dateFormatter.string(from: currentDate)+"," + currentYear
            return newDate
        }
        return ""
    }
}

//MARK: Extenions
extension CAGradientLayer{
    
    func layerWithColor(colors:[CGColor],shouldBeHorizontal:Bool) -> CAGradientLayer {
        self.colors = colors;
        if shouldBeHorizontal {
            self.startPoint = CGPoint.init(x: 0.0, y: 0.5)
            self.endPoint   = CGPoint.init(x: 1.0, y: 0.5)
        }else {
            self.locations = [0.0,1.0]
        }
        
        return self;
    }
}

extension Date {
    
    func daysInCurrentMonth() -> Int? {
        
        let dateRange = Calendar.current.range(of: .day, in: .month, for: Date())
        let days      = dateRange?.count
        return days!
    }
    
    func dateWithFormatter(formatter:DateFormatter) -> String? {
        return formatter.string(from: Date())
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
