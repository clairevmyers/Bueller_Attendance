//
//  GroupView.swift
//  Bueller Attendance
//
//  Created by Grace Hansen on 1/3/18.
//  Copyright © 2018 District196. All rights reserved.
//

import UIKit

class GroupView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var passedGroup = GroupClass()
    var passedStudent = StudentClass()
    
    
    @IBOutlet weak var addStudentButton: UIButton!
    var name = String()
    var indexNum = Int()



    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        print(indexNum)
        return groupArr[indexNum].studentList.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = groupArr[indexNum].studentList[indexPath.row].FirstName
        
        return cell

    }
    


    
    
     func viewDidAppear()
     {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    }

    


