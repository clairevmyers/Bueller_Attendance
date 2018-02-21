//
//  ViewController.swift
//  Bueller Attendance
//
//  Created by MYERS, CLAIRE on 12/7/17.
//  Copyright © 2017 District196. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var PickerLabel: UILabel!
    @IBOutlet weak var SchedulePicker: UIPickerView!
    @IBOutlet weak var startTimeField: UITextField!
    @IBOutlet weak var endTimeField: UITextField!
    
    @IBOutlet weak var groupTable: UITableView!
    
    
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
        return groupArr.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {

        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = groupNames[indexPath.row]
        
        return cell
        
    }

    func viewDidAppear()
    {
        super.viewDidLoad()

    }
}

