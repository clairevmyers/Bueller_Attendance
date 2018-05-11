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
        print(groupNames)
        print(indexNum)
        for (String) in groupDict
        {
            print(String)
        }
        return groupDict[currentGroup]!.studentList.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StudentCell
        cell.First.text = groupDict[currentGroup]!.studentList[indexPath.row].FirstName
        cell.Last.text = groupDict[currentGroup]!.studentList[indexPath.row].LastName
        cell.ID.text = groupDict[currentGroup]!.studentList[indexPath.row].StudentID
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        myindex = indexPath.row
        currentStudent = (groupDict[currentGroup]?.studentList[indexPath.row])!
        performSegue(withIdentifier: "groupCellToStudent", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        gD.archive(fileName: "Group D")
        StudentA.archive(fileName: "Student A")
        if(segue.identifier == "groupToStudent")
        {
                var view = segue.destination as! StudentView
            view.returnTo = "View"
        }
        
        else if(segue.identifier == "groupCellToStudent")
        {
            var view = segue.destination as! EditStudent
            view.returnTo = "View"
        }
    }
    
 


    
    
    override func viewDidLoad()
     {
        super.viewDidLoad()
        groupLabel.text = groupDict[currentGroup]?.name
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        passedGroup.restore(fileName: "Saved Groups")
        passedStudent.restore(fileName: "Saved Student")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   
    
   

    

}
