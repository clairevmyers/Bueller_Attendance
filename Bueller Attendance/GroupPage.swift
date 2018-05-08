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

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //return length of array
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return groupDict[currentGroup]!.studentList.count
    }
    
    //Change Attendance Swiping Actions Method
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        //Index of Object being swiped
        myindex = indexPath.row
        
        //Present Action
        let present = UIContextualAction(style: .normal, title: "present"){ (action, view, handler) in
            groupDict[currentGroup]!.studentList[myindex].AttendanceStatus = "P"
            tableView.reloadData()
        }
       present.backgroundColor = UIColor.green
        
        //Tardy Action
        let tardy = UIContextualAction(style: .normal, title: "tardy"){ (action, view, handler) in
            groupDict[currentGroup]!.studentList[myindex].AttendanceStatus = "T"
            tableView.reloadData()
        }
        tardy.backgroundColor = UIColor.orange
        
        //Absent Action
        let absent = UIContextualAction(style: .normal, title: "absent"){ (action, view, handler) in
            groupDict[currentGroup]!.studentList[myindex].AttendanceStatus = "A"
            tableView.reloadData()
        }
        absent.backgroundColor = UIColor.red
        
        //Create and Return Configuration
        let configuration = UISwipeActionsConfiguration(actions: [present,tardy,absent])
        return configuration
    }
    
    //Delete Students Swiping Actions
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        //Index and name of object being swiped
        let index = indexPath.row
        let name = groupNames[indexPath.row]
        
        
        
        //Delete Action
        let delete = UIContextualAction(style: .destructive, title: "Delete")
        {
            (action, view, nil) in
            deleteStudent(index: index)
            tableView.reloadData()
            print("Delete")
        }
        //Return Swipe Configuration
        return UISwipeActionsConfiguration(actions:[delete])
        
    }
    
    //Intilize Tableview Cells
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //Creation of the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SummaryCell
        
        cell.first.text = groupDict[currentGroup]!.studentList[indexPath.row].FirstName
        cell.last.text = groupDict[currentGroup]!.studentList[indexPath.row].LastName
        cell.status.text = groupDict[currentGroup]!.studentList[indexPath.row].AttendanceStatus
        if(cell.status.text == "A")
        {
            cell.status.textColor = UIColor.red
        }
        else if(cell.status.text == "P")
        {
            cell.status.textColor = UIColor.green
        }
        else
        {
            cell.status.textColor = UIColor.orange
        }
        
        return cell
        
    }
    
    //Selected cell Method
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        //Index of object selected
        myindex = indexPath.row
        
        //Sets the current student
        currentStudent = (groupDict[currentGroup]?.studentList[indexPath.row])!
        
        //performs segue to editStudents
        performSegue(withIdentifier: "groupCellToStudent", sender: self)
    }

    //Prepare for Segueing to a new viewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        //GroupPage to TakeAttendanceView
    if(segue.identifier == "groupPageToTakeAttendanceView")
        {
            let view = segue.destination as? TakeAttendanceView
            view?.groupString = groupName
        }
        
        //GroupPage to viewController
        else if(segue.identifier == "groupPageToMain")
        {
            dismiss(animated: true, completion: nil)
        }
        
        //GroupPage to EditStudent
        else if(segue.identifier == "groupCellToStudent")
        {
            let view = segue.destination as? EditStudent
            view?.returnTo = "Page"
        }

    }
    
    //Export to CSV method
    @IBAction func ExportStudentInfo(_ sender: Any) {
       
        //Create headers of CSV
        var attendanceExport = "Student ID, First Name, Last Name, Attendance Status\n"
        
        //Add student data to CSV
        for student in (groupDict[currentGroup]?.studentList)!
        {
            
            attendanceExport.append(student.StudentID + ",")
            attendanceExport.append(student.FirstName + ",")
            attendanceExport.append(student.LastName + ",")
            attendanceExport.append(student.AttendanceStatus)
            attendanceExport.append("\n")
        }
        
        //File name
        print("\(currentGroup) \(month)/\(day)")
        let fileName = "\(currentGroup) \(month)/\(day).csv"
        let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName)
        do
        {
            print(attendanceExport)
            try attendanceExport.write(to: path!, atomically: true, encoding: String.Encoding.utf8)
            
        }
        catch
        {
            print("Failed to create File")
            print("\(error)")
           
        }
        
        let activityVC = UIActivityViewController(activityItems: [path], applicationActivities: [])
        present(activityVC, animated: true, completion: nil)
        if let popOver = activityVC.popoverPresentationController
        {
            popOver.sourceView = self.view
        }
    }
}

