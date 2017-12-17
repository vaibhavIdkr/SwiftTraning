//
//  TimePickerDataSource.swift
//  SwiftTraning
//
//  Created by Vaibhav Indalkar on 17/12/17.
//  Copyright © 2017 Vaibhav Indalkar. All rights reserved.
//

import UIKit

class TimePickerDataSource: NSObject,UIPickerViewDelegate,UIPickerViewDataSource {
    
    let dataSource = TimePickerData()
    let numberOfRowsForPickerOne = TimePickerData().numberOfRowsForPickerOne()
    let numberOfRowsForPickerTwo = TimePickerData().numberOfRowsForPickerTwo()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0 {
            return numberOfRowsForPickerOne
        }else {
            return numberOfRowsForPickerTwo
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100;
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30;
    }
    
}

class TimePickerData {
    
    func numberOfRowsForPickerOne() -> Int  {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh"
        if let time = Date().dateWithFormatter(formatter:formatter) {
            return (time as NSString).integerValue
        }
        
        return 0;
    }
    
    func numberOfRowsForPickerTwo() -> Int  {
        return 60;
    }
}
