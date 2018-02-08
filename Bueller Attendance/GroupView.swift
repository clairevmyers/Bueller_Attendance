//
//  GroupView.swift
//  Bueller Attendance
//
//  Created by Grace Hansen on 1/3/18.
//  Copyright © 2018 District196. All rights reserved.
//

import UIKit

class GroupView: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    var passedGroup = GroupClass()
    var passedStudent = StudentClass()
    

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
    


    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
}

