//
//  GroupClass.swift
//  Bueller Attendance
//
//  Created by Grace Hansen on 1/11/18.
//  Copyright © 2018 District196. All rights reserved.
//

import UIKit


class GroupClass {
    
    var name = ""
    var studentList = [StudentClass]()
    var checkInDuration = 0.0
    var index = Int()
    
    init()
    {
        
    }
    
    init(tempName: String)
    {
        name = tempName
    }
    
    

    
}
