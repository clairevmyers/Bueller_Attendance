//
//  StudentView.swift
//  Bueller Attendance
//
//  Created by Grace Hansen on 1/3/18.
//  Copyright © 2018 District196. All rights reserved.
//

import UIKit

class StudentView: UIViewController {
    
    
    
    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var StudentID: UITextField!
    @IBOutlet weak var GradeControl: UISegmentedControl!
    var Grade = 9;
    var groupName = String()
    var returnTo = String()
    
    @IBOutlet weak var returnToPage: UIButton!
    @IBOutlet weak var returnToAttendance: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
      StudentID.text = newID
    
        if(returnTo == "View")
        {
            returnToAttendance.isHidden = true
            returnToAttendance.isEnabled = false
        }
        else if(returnTo == "Attendance")
        {
            returnToPage.isHidden = true
            returnToPage.isEnabled = false
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
  
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        gD.archive(fileName: "Group D")
        StudentA.archive(fileName: "Student A")
        
        if(segue.identifier == "studentToGroup")
        {
        var view = segue.destination as! GroupView
        var student = StudentClass(First: FirstName.text!, Last: LastName.text!, ID: StudentID.text!, Year: Grade)
        groupDict[currentGroup]!.studentList.append(student)
        view.name = groupName
        newID = ""
        
        }
        else if (segue.identifier == "studentToTakeAttendance")
            {
                var student = StudentClass(First: FirstName.text!, Last: LastName.text!, ID: StudentID.text!, Year: Grade)
                groupDict[currentGroup]!.studentList.append(student)
    
            newID = ""
                dismiss(animated: true, completion: nil)
        }
        
    }
    

    @IBAction func cancel(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
    
}








