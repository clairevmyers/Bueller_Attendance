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
        
        //group.restore(fileName: "Saved Name")
    }
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let present = UIContextualAction(style: .normal, title: "Present")
        {
            (action, view, nil) in
            
            print("present")
        }
        return UISwipeActionsConfiguration(actions:[present])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let index = indexPath.row
        let name = groupNames[indexPath.row]
        
        let delete = UIContextualAction(style: .destructive, title: "Delete")
        {
            (action, view, nil) in
            deleteGroup(name: name, index: index)
            tableView.reloadData()
            print("Delete")
        }
        return UISwipeActionsConfiguration(actions:[delete])
        
    }


    //Function to tell the tableView how many cells it needs
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return groupDict.count
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

        name = groupNames[indexPath.row]
        currentGroup = name
        performSegue(withIdentifier: "mainToGroupPage", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if( segue.identifier ==
            "mainToGroupPage")
    {
            var view = segue.destination as! GroupPage
            view.groupName = (groupDict[name]?.name)!
        }
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

