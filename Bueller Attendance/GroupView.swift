//
//  GroupView.swift
//  Bueller Attendance
//
//  Created by Grace Hansen on 1/3/18.
//  Copyright © 2018 District196. All rights reserved.
//

import UIKit

class GroupView: UIViewController  {
    
    let cellReuseIdentifier = "tableCell"

    @IBOutlet weak var tableView: UITableView!
    var passedGroup = GroupClass()
    var passedStudent = StudentClass()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(passedStudent.FirstName)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath as IndexPath) as! tableCell
        
        //cell.labels["text"]?.Label.text = passedGroup.studentList[_].FirstName
        
        //return cell
    }
    
   
    
}

