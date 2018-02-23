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
        for (String) in groupArr
        {
            print(String)
        }
        return groupArr[groupName]!.studentList.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = groupArr[groupName]!.studentList[indexPath.row].FirstName
        
        return cell
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "groupPageToTakeAttendanceView")
        {
            var view = segue.destination as! TakeAttendanceViewViewController
            view.groupName = groupName
        }
    }

}
