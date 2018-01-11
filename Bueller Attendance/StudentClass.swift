//
//  StudentClass.swift
//  Bueller Attendance
//
//  Created by Grace Hansen on 1/9/18.
//  Copyright © 2018 District196. All rights reserved.
//
import UIKit
class StudentClass: NSObject {
    
    var FirstName = ""
    var LastName = ""
    var StudentID = ""
    var Grade = 9
    var AttendanceStatus = "A"
    
    override init()
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
        studentList.append(PlaceHolder)
    }
    
}
var studentList: Array<StudentClass> = Array()
var Grace = StudentClass(First: "Grace", Last: "Hansen", ID: "762954", Year: 9)

