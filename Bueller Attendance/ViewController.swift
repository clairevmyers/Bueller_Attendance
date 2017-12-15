//
//  ViewController.swift
//  Bueller Attendance
//
//  Created by MYERS, CLAIRE on 12/7/17.
//  Copyright © 2017 District196. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var PickerLabel: UILabel!
    @IBOutlet weak var SchedulePicker: UIPickerView!
    
    let schedules = ["Normal", "Flex", "Pepfest", "Finals Day 1", "Finals Day 2"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return schedules[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return schedules.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        PickerLabel.text = schedules[row]
    }
    
    @IBOutlet weak var DateText: UILabel!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("\(hour):\(minute):\(second)")
        print("\(day).\(month)")
        
        DateText.text =  "\(month)/\(day)"
        
        
        
        

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

