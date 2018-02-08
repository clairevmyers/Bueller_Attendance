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
    @IBOutlet weak var startTimeField: UITextField!
    @IBOutlet weak var endTimeField: UITextField!
    
    @IBOutlet weak var groupTable: UITableView!
    
    
    let startPicker = UIDatePicker()
    
    let schedules = ["Normal", "Flex", "Pepfest", "Finals Day 1", "Finals Day 2"]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        var segue = segue.destination as! GroupView
        var group = GroupClass()
        groupArr.append(group)
        //segue.passedGroup = group
    }
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
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return groupArr[0].studentList.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = groupArr[0].studentList[indexPath.row].FirstName
        
        return cell
        
    }


}

