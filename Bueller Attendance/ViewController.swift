//
//  ViewController.swift
//  Bueller Attendance
//
//  Created by MYERS, CLAIRE on 12/7/17.
//  Copyright © 2017 District196. All rights reserved.
//

import UIKit

var myindex = 0
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //Table view that displays groupNames
    @IBOutlet weak var groupTable: UITableView!
    
    //Placeholder variable for GroupPage
    var name = String()
    
    //Button to advance to GroupPage
    @IBOutlet var AttendanceButton: UIButton!
    
    //Text that displays date
    @IBOutlet weak var DateText: UILabel!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Print date and time in debugger
        print("\(hour):\(minute):\(second)")
        print("\(day).\(month)")
        
        //Made DateText display the date
        DateText.text =  "\(month)/\(day)"
    }


    //Function to tell the tableView how many cells it needs
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        myindex = indexPath.row
        print(name)
        name = groupNames[indexPath.row]
        print(name)
        performSegue(withIdentifier: "mainToGroupPage", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if( segue.identifier == "mainToGroupPage")
        {
            var view = segue.destination as! GroupPage
            view.groupName = (groupArr[name]?.name)!
        }
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

