//
//  globalHolder.swift
//  Bueller Attendance
//
//  Created by Claire on 5/2/18.
//  Copyright © 2018 District196. All rights reserved.
//

import Foundation
class globalHolder : Codable
{
    var groupD = groupDict
    var groupN = groupNames
    
    func archive(fileName: String)
    {
        groupD = groupDict
        groupN = groupNames
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
                let recoveredData = try PropertyListDecoder().decode(globalHolder.self,
                                                                     from: recoveredDataCoded)
                print("Data successfully recovered from file.")
                groupD = recoveredData.groupD
                groupDict = groupD
                groupN = recoveredData.groupN
                groupNames = groupN
                
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
