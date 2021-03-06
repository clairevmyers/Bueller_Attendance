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
    

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Initialize and Restore
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        //Restoring Data
        //gD.restore(fileName: "Group D")
        //StudentA.restore(fileName: "StudentA")
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init?(coder aDecoder: NSCoder)
    {
        //gD.restore(fileName: "Group D")
        //StudentA.restore(fileName: "StudentA")
        super.init(coder: aDecoder)
    }

    //What happens when the viewController Loads
    override func viewDidLoad()
    {
        print(groupNames)
        super.viewDidLoad()
        //Compare dates
        //If the day has chang
        let addToSummary = isWeekend()
        
        if (checkDate() == true)
        {
            //reset the attendance status
            resetAttendanceStatus()
            if(addToSummary == true)
            {
                
            }
        }

        //Print date and time in debugger
        print("\(hour):\(minute):\(second)")
        print("\(day).\(month)")
        
        //Made DateText display the date
        DateText.text =  "\(month)/\(day)"
        
        
    }

    
    
    //Count for number of cells in table
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return groupDict.count
    }
    
    //Initialize cells
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        print(groupNames)
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = groupNames[indexPath.row]
        
        return cell
        
    }
    
    //Segue to Group page based on cell clicked
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        myindex = indexPath.row
        //Get the name of the row
        name = groupNames[indexPath.row]
        //Assign it to the currentGroup
        currentGroup = name
        //Perform Segue to GroupPage
        performSegue(withIdentifier: "mainToGroupPage", sender: self)
    }
    
    
    //Trailing Swipe Function
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let index = indexPath.row
        let name = groupNames[indexPath.row]
        
        //Delete Action
        let delete = UIContextualAction(style: .destructive, title: "Delete")
        {
            (action, view, nil) in
            deleteGroup(name: name, index: index)
            tableView.reloadData()
            gD.archive(fileName: "Group D")
            print("Delete")
        }
        return UISwipeActionsConfiguration(actions:[delete])
        
    }
    @IBAction func resetButton(_ sender: Any)
    {
        resetAttendanceStatus()
    }
    
    //Prepare for Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        gD.archive(fileName: "Group D")
        StudentA.archive(fileName: "Student A")
        //Main to GroupPage
        if( segue.identifier ==
            "mainToGroupPage")
        {
        
        }
    }
    
}

