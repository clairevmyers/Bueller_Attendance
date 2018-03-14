//
//  Tesst.swift
//  Bueller Attendance
//
//  Created by Grace Hansen on 3/14/18.
//  Copyright © 2018 District196. All rights reserved.
//

import UIKit

class Tesst: UIViewController {
var groupName = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        if(segue.identifier == "fromTest")
        {
           print(groupName)
            let view = segue.destination as? GroupPage
            view?.groupName = groupName
        }
    }

}
