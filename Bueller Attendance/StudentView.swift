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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    @IBAction func ChangeGrade(_ sender: Any)
    {
        if GradeControl.selectedSegmentIndex == 0
        {
            Grade = 9
        }
        else if GradeControl.selectedSegmentIndex == 1
        {
            Grade = 10
        }
        else if GradeControl.selectedSegmentIndex == 2
        {
            Grade = 11
        }
        else
        {
            Grade = 12
        }
        print(Grade)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
  
  
    @IBAction func PassStudent(_ sender: Any)
    {
        if FirstName.text != ""
        {

                var addedStudent = StudentClass(First: FirstName.text!, Last: LastName.text!, ID: StudentID.text!, Year: Grade)
                        addedStudent.addStudent(PlaceHolder: addedStudent )
            performSegue(withIdentifier: "popUpSegue", sender: self)
            
            
        }
        else
        {
            print("Must contain a value")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        var group = segue.destination as! GroupView
        
        //group.StudentName = FirstName.text!
    }
    
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */



