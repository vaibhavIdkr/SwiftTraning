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
