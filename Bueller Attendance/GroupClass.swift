//
//  GroupClass.swift
//  Bueller Attendance
//
//  Created by Grace Hansen on 1/11/18.
//  Copyright © 2018 District196. All rights reserved.
//

import UIKit


class GroupClass {
    
    var Name = ""
    var studentList = [StudentClass]()
    var checkInDuration = 0.0
    
    init()
    {
        
    }
    
    init(TempName: String, time: Double)
    {
        Name = TempName
        checkInDuration = time
    }
    
    

}
