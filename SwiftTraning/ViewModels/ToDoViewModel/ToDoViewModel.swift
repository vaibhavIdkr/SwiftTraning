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
    
    func gradientLayer(shouldBeHorizontal:Bool) -> CAGradientLayer {
        
        let topColor = UIColor.init(red: 1.0, green: 149/255.0, blue: 43/255.0, alpha: 1)
        let bottomColor = UIColor.init(red: 242/255.0, green: 32/255.0, blue: 85/255.0, alpha: 1)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor,bottomColor]
        if shouldBeHorizontal {
            gradientLayer.startPoint = CGPoint.init(x: 0.0, y: 0.5)
            gradientLayer.endPoint   = CGPoint.init(x: 1.0, y: 0.5)
        }else {
            gradientLayer.locations = [0.0,1.0]
        }
    
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
