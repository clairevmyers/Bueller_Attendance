//
//  PersistentData.swift
//  Bueller Attendance
//
//  Created by Claire on 4/13/18.
//  Copyright © 2018 District196. All rights reserved.
//

import UIKit

class PersistentData: Codable {
    //class definition
    /*//Dictionary key = groupName and GroupClass
    var groupDict : [String: GroupClass]
    
    //Array of keys/groupNames
    var groupNames : [String]
    var currentGroup : String
    var newID : String */
    
    //Group
    var groupName : String
    //var studentList : [StudentClass]
    
    //Student
    var FirstName : String
    var LastName : String
    var StudentID : String
    var Grade : Int

    //Object Initialization (constructor)
    init()
    {
        //Group
        groupName = "Practice"
        //var studentList = [StudentClass]()
    
        //Student
        FirstName = "Grace"
        LastName = "Hansen"
        StudentID = "764779"
        Grade = 11

    }
    // Object Archiving (saving)
    /**
     * Archive this MeetClass object
     * @param: fileName to which to archive this object
     */
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
                    let recoveredData = try PropertyListDecoder().decode(PersistentData.self,
                                                                         from: recoveredDataCoded)
                    print("Data successfully recovered from file.")
                    //groupNames = recoveredData.groupNames
                    FirstName = recoveredData.FirstName
                    LastName = recoveredData.LastName
                    StudentID = recoveredData.StudentID
                    Grade = recoveredData.Grade
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
}
