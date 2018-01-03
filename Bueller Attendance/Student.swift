//
//  Student.swift
//  Bueller Attendance
//
//  Created by HANSEN, GRACE on 1/2/18.
//  Copyright © 2018 District196. All rights reserved.
//
import Foundation
class Student
{
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
        
    }
    
}
