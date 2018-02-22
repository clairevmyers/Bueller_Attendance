//
//  GroupPage.swift
//  Bueller Attendance
//
//  Created by Grace Hansen on 2/21/18.
//  Copyright © 2018 District196. All rights reserved.
//

import UIKit

class GroupPage: UIViewController {
    
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
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "groupPageToTakeAttendanceView")
        {
            var view = segue.destination as! TakeAttendanceViewViewController
            view.groupName = groupName
        }
    }

}
