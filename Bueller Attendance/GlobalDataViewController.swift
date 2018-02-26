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
var groupArr = [String: GroupClass]()

//Array of keys/groupNames
var groupNames = [String]()


class GlobalDataViewController: UIViewController
{

}
