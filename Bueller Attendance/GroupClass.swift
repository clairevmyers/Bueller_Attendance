//
//  GroupClass.swift
//  Bueller Attendance
//
//  Created by Grace Hansen on 1/11/18.
//  Copyright © 2018 District196. All rights reserved.
//

import UIKit


class GroupClass : Codable{
    
    var name = ""
    var studentList = [StudentClass]()
    var checkInDuration = 0.0
    var index = Int()
    var exportLog = String()
    
    init()
    {
        name = "Group"
        studentList = [StudentClass]()
        checkInDuration = 0.0
        index = 0
    }
    
    init(tempName: String)
    {
        name = tempName
    }
    
    func archive(fileName: String)
    {
        let documentsDirectory = FileManager().urls(for: .documentDirectory,
                                                    in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent(fileName)
        do
        {
            let encodedData = try PropertyListEncoder().encode(self)
            let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(encodedData, toFile: archiveURL.path)
            if isSuccessfulSave
            {
                print("Data successfully saved to file.")
            }
            else
            {
                print("Failed to save data...")
            }
        }
        catch
        {
            print("Failed to save data...")
        }
    }
        // Object Recovery (if previously saved)
        /**
         * Recover the previously archived MeetClass object
         * @param: fileName from which to recover the previously archived file
         */
    
        func restore(fileName: String)
        {
            let documentsDirectory = FileManager().urls(for: .documentDirectory,
                                                        in: .userDomainMask).first!
            let archiveURL = documentsDirectory.appendingPathComponent(fileName)
            if let recoveredDataCoded = NSKeyedUnarchiver.unarchiveObject(
                withFile: archiveURL.path) as? Data
            {
                do
                {
                    let recoveredData = try PropertyListDecoder().decode(GroupClass.self,
                                                                         from: recoveredDataCoded)
                    print("Data successfully recovered from file.")
                    name = recoveredData.name
                    studentList = recoveredData.studentList
                    checkInDuration = recoveredData.checkInDuration
                    index = recoveredData.index
                    
                }
                catch
                {
                    print("Failed to recover data")
                }
            }
            else
            {
                print("Failed to recover data")
            }
        }
    }

    

