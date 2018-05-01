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
        
        return groupDict[currentGroup]!.studentList.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
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
            cell.status.textColor = UIColor.yellow
        }
        
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
        
        if(segue.identifier == "groupPageToTakeAttendanceView")
        {
            let view = segue.destination as? TakeAttendanceView
            view?.groupString = groupName
        }
        else if(segue.identifier == "groupPageToMain")
        {
            
        }
        else if(segue.identifier == "groupCellToStudent")
        {
            let view = segue.destination as? EditStudent
            view?.returnTo = "Page"
        }

    }
    @IBAction func ExportStudentInfo(_ sender: Any) {
        var attendanceExport = "Student ID, First Name, Last Name, Attendance Status,"
        
        for student in (groupDict[currentGroup]?.studentList)!
        {
            
            attendanceExport.append(student.StudentID + ",")
            attendanceExport.append(student.FirstName + ",")
            attendanceExport.append(student.LastName + ",")
            attendanceExport.append(student.AttendanceStatus)
            attendanceExport.append("\n")
            
            let activityVC = UIActivityViewController(activityItems: [attendanceExport], applicationActivities: nil)
            present(activityVC, animated: true, completion: nil)
            if let popOver = activityVC.popoverPresentationController
            {
                popOver.sourceView = self.view
            }
        }
    }
}

