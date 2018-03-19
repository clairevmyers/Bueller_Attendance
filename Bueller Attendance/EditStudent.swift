//
//  StudentView.swift
//  Bueller Attendance
//
//  Created by Grace Hansen on 1/3/18.
//  Copyright © 2018 District196. All rights reserved.
//

import UIKit

class EditStudent: UIViewController {
    
    
    
    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var StudentID: UITextField!
    @IBOutlet weak var GradeControl: UISegmentedControl!
    var Grade = 9;
    var groupName = String()
    
    @IBOutlet weak var changeStudent: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        FirstName.text = currentStudent.FirstName
        LastName.text = currentStudent.LastName
        StudentID.text = currentStudent.StudentID
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        var view = segue.destination as! GroupView
        var student = StudentClass(First: FirstName.text!, Last: LastName.text!, ID: StudentID.text!, Year: Grade)
        groupDict[groupName]!.studentList.append(student)
        view.name = groupName
        
        
    }
    
    
    @IBAction func cancel(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
    
}


