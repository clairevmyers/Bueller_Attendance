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
        for (String) in groupDict
        {
            print(String)
        }
        return groupDict[name]!.studentList.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StudentCell
        cell.First.text = groupDict[name]!.studentList[indexPath.row].FirstName
        cell.Last.text = groupDict[name]!.studentList[indexPath.row].LastName
        cell.ID.text = groupDict[name]!.studentList[indexPath.row].StudentID
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        myindex = indexPath.row
        performSegue(withIdentifier: "groupCellToStudent", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {

        if(segue.identifier == "groupToStudent")
        {
                var view = segue.destination as! StudentView
                view.groupName = name
        }
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
