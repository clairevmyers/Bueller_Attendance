//
//  CreateGroup.swift
//  Bueller Attendance
//
//  Created by Grace Hansen on 2/12/18.
//  Copyright © 2018 District196. All rights reserved.
//

import UIKit

class CreateGroup: UIViewController {

    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var groupName: UITextField!
    var passingGroup = GroupClass()
    
    func viewDidAppear() {
        

        
        // Do any additional setup after loading the view.
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        doneButton.isEnabled = false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func createGroup(_ sender: Any)
    {
        var group = GroupClass(tempName: groupName.text!)
        passingGroup = group
        groupDict[groupName.text!] = group
        groupNames.append(groupName.text!)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        //var index = getGroupIndex(groupName: groupName.text!)
        var destination = segue.destination as! GroupView
        destination.passedGroup = passingGroup
        destination.name = groupName.text!
        //destination.indexNum = index
    }
    


    @IBAction func textDidChange(_ sender: AnyObject)
    {
        print("editing")
        var enable = validateName(text: sender.text!)
        if( enable == true)
        {
            doneButton.isEnabled = true
        }
        else
        {
            doneButton.isEnabled = false
        }
    }
    
    func validateName (text: String) -> Bool
    {
        var result = false
        if(text != "")
        {
            result = true
        }
        else
        {
            result = false
        }
        return result
    }
    
   

}
