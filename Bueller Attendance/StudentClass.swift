//
//  StudentClass.swift
//  Bueller Attendance
//
//  Created by Grace Hansen on 1/9/18.
//  Copyright © 2018 District196. All rights reserved.
//
import UIKit
class StudentClass {
    
    var FirstName = ""
    var LastName = ""
    var StudentID = ""
    var Grade = 9
    var AttendanceStatus = "A"

     init()
    {
        
    }
    
    init(First: String, Last: String, ID: String, Year: Int)
    {
        FirstName = First
        LastName = Last
        StudentID = ID
        Grade = Year
        
        //studentList.append()
    }
    
    func addStudent(PlaceHolder: StudentClass)
    {
        
    }
    
}


