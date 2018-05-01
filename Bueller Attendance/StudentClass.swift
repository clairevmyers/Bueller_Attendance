//
//  StudentClass.swift
//  Bueller Attendance
//
//  Created by Grace Hansen on 1/9/18.
//  Copyright © 2018 District196. All rights reserved.
//
import UIKit
class StudentClass : Codable{
    
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
    
    func addStudent(PlaceHolder: StudentClass)
    {
        
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
                    let recoveredData = try PropertyListDecoder().decode(StudentClass.self,
                                                                         from: recoveredDataCoded)
                    print("Data successfully recovered from file.")
                    FirstName = recoveredData.FirstName
                    LastName = recoveredData.LastName
                    StudentID = recoveredData.StudentID
                    Grade = recoveredData.Grade
                    AttendanceStatus = recoveredData.AttendanceStatus
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



