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
    var passedGroupFurther = GroupClass()
    
    @IBOutlet weak var addStudentButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
      
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
  
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        var view = segue.destination as! GroupView
        var student = StudentClass(First: FirstName.text!, Last: LastName.text!, ID: StudentID.text!, Year: Grade)
    groupArr[passedGroupFurther.index].studentList.append(student)
        view.passedGroup = passedGroupFurther
        print("This is running")
        
        
    }
    


}

func TextFieldDidBeginEditing(textField: UITextField)
{
    print("Method Running")
}






