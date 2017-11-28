//
//  ToDoViewModel.swift
//  SwiftTraning
//
//  Created by Vaibhav T. Indalkar on 28/11/17.
//  Copyright © 2017 Vaibhav Indalkar. All rights reserved.
//

import UIKit

class ToDoViewModel: NSObject {

    func pushPopTransationAnimation() -> (CATransition){
        
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionFade
        return transition
    }
    
    func stringFromDate() -> (String?) {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: currentDate)
    }
    
    func dayOfWeekFromDate() -> (String?) {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: currentDate)
    }
    
    func yearFromDate() -> (String?){
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: currentDate)
    }
    
    func combinedMonthYearFromDate() -> (String?) {
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
