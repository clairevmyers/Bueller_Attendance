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
    var returnTo = String()
    @IBOutlet weak var changeStudent: UIButton!
    @IBOutlet weak var returnToView: UIButton!
    @IBOutlet weak var returnToPage: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        
        FirstName.text = currentStudent.FirstName
        LastName.text = currentStudent.LastName
        StudentID.text = currentStudent.StudentID
        
        if(returnTo == "View")
        {
            returnToPage.isEnabled = false
        }
        else if(returnTo == "Group")
        {
            returnToView.isEnabled = false
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        findStudent(code: currentStudent.StudentID, first: FirstName.text!, last: LastName.text!, identification: StudentID.text!, grade: 11)
        
        
    }
    
    
    @IBAction func cancel(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
    
}


