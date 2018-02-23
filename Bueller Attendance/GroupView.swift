//
//  GroupView.swift
//  Bueller Attendance
//
//  Created by Grace Hansen on 1/3/18.
//  Copyright © 2018 District196. All rights reserved.
//

import UIKit

class GroupView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var addStudentButton: UIButton!
    @IBOutlet weak var groupLabel: UILabel!
    var name = String()
    var indexNum = Int()
    var passedGroup = GroupClass()
    var passedStudent = StudentClass()




    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        print(indexNum)
        for (String) in groupArr
        {
            print(String)
        }
        return groupArr[name]!.studentList.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = groupArr[name]!.studentList[indexPath.row].FirstName
        
        return cell

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {

        if(segue.identifier == "groupToStudent")
        {
                var view = segue.destination as! StudentView
                view.groupName = name
        }
    }
    
 

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        //if(segue = GroupToStudent)
        //{
         //   var view = segue.destination as! StudentView
         //   view.passedGroupFurther = passedGroup
        //}
        
    }
    
    
    override func viewDidLoad()
     {
        super.viewDidLoad()
        groupLabel.text = name

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   


    

}
