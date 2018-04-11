//
//  GlobalDataViewController.swift
//  Bueller Attendance
//
//  Created by MYERS, CLAIRE on 12/14/17.
//  Copyright © 2017 District196. All rights reserved.
//

import UIKit
//Global date and time variables
let date = Date()
let calendar = Calendar.current
let hour = calendar.component(.hour, from: date)
let minute = calendar.component(.minute, from: date)
let second = calendar.component(.second, from: date)
let day = calendar.component(.day, from: date)
let month = calendar.component(.month, from: date)

//Dictionary key = groupName and GroupClass
var groupDict = [String: GroupClass]()

//Array of keys/groupNames
var groupNames = [String]()
var currentGroup = String()
var newID = String()
var currentStudent = StudentClass(First: "Grace", Last: "Hansen", ID: "762954", Year: 11)

public func findStudent(code: String, first: String, last: String, identification: String, grade: Int)
{
    for student in (groupDict[currentGroup]?.studentList)!
    {
        
        var ID = student.StudentID
        if( ID == code)
        {
            
            student.FirstName = first
            student.LastName = last
            student.Grade = grade
            student.StudentID = identification

        }
    }
}


class GlobalDataViewController: UIViewController
{

}
