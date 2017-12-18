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
    let pickerOneData = TimePickerData().numberOfRowsForPickerOne()
    let pickerTwoData = TimePickerData().numberOfRowsForPickerTwo()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        pickerView.subviews.forEach({
            $0.isHidden = $0.frame.height < 1.0
        })
        
        return 2;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0 {
            return pickerOneData.count
        }else {
            return pickerTwoData.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 80;
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30;
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var pickerViewLabel = view as? UILabel
        
        if pickerViewLabel == nil {
            pickerViewLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 80, height: 30))
            pickerViewLabel?.font = UIFont.init(name: "Roboto-Medium", size: 15)
            pickerViewLabel?.textColor = UIColor.init(red: 62/255, green: 62/255, blue: 62/255, alpha: 1)
            pickerViewLabel?.textAlignment = .center
        }
        
        switch component {
        case 0:
            pickerViewLabel?.text = pickerOneData[row];
        case 1:
            pickerViewLabel?.text = pickerTwoData[row];
        default:
            break
        }
        return pickerViewLabel!
    }
}

class TimePickerData {
    
    func numberOfRowsForPickerOne() -> [String] {
        
        var rowOneDataArray = [String]()
        let formatter = DateFormatter()
        formatter.dateFormat = "hh"
        if let time = Date().dateWithFormatter(formatter:formatter) {
            let time = (time as NSString).integerValue
            for rowIndex in time..<24 {
                rowOneDataArray.append("\(rowIndex)")
            }
        }
        return rowOneDataArray;
    }
    
    func numberOfRowsForPickerTwo() -> [String]  {
        
        var rowTwoDataArray = [String]()
        let formatter = DateFormatter()
        formatter.dateFormat = "mm"
        
        if let minutes = Date().dateWithFormatter(formatter: formatter){
            
            let minutesForPicker = (minutes as NSString).integerValue + 5
            for rowIndex in minutesForPicker..<60 {
                rowTwoDataArray.append("\(rowIndex)")
            }
        }
         return rowTwoDataArray
    }
}
