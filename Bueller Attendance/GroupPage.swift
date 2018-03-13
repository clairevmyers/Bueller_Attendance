//
//  GroupPage.swift
//  Bueller Attendance
//
//  Created by Grace Hansen on 2/21/18.
//  Copyright © 2018 District196. All rights reserved.
//

import UIKit

class GroupPage: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var groupNameLabel: UILabel!
    var groupName = String()

    override func viewDidLoad() {
        super.viewDidLoad()

        groupNameLabel.text = groupName
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        for (String) in groupDict
        {
            print(String)
        }
        return groupDict[groupName]!.studentList.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SummaryCell
        cell.first.text = groupDict[groupName]!.studentList[indexPath.row].FirstName
        cell.last.text = groupDict[groupName]!.studentList[indexPath.row].LastName
        cell.status.text = groupDict[groupName]!.studentList[indexPath.row].AttendanceStatus
        
        return cell
        
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
        let delete = UIContextualAction(style: .destructive, title: "Delete")
        {
            (action, view, nil) in
            print("Delete")
        }
        return UISwipeActionsConfiguration(actions:[delete])
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        if(segue.identifier == "groupPageToTakeAttendanceView")
        {
            let view = segue.destination as? TakeAttendanceView
            view?.groupString = groupName
        }
        else if(segue.identifier == "groupPageToMain")
        {
            dismiss(animated: true, completion: nil)
        }
    }

}
