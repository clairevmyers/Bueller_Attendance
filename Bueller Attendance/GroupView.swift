//
//  GroupView.swift
//  Bueller Attendance
//
//  Created by Grace Hansen on 1/3/18.
//  Copyright © 2018 District196. All rights reserved.
//

import UIKit

class GroupView: UIViewController {
    @IBOutlet weak var myString: UILabel!
    var StudentName = String()
    @IBAction func StartTime(_ sender: Any) {
        var temp = StartTimePicker.date as NSDate
        startText.text = temp.description
    }
    @IBOutlet weak var StartTimePicker: UIDatePicker!
    @IBOutlet weak var startText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //myString.text = StudentName
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

