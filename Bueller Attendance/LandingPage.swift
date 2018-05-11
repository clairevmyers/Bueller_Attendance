//
//  LandingPage.swift
//  Bueller Attendance
//
//  Created by Grace Hansen on 5/11/18.
//  Copyright © 2018 District196. All rights reserved.
//

import UIKit

class LandingPage: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        gD.restore(fileName: "Group D")
        StudentA.restore(fileName: "StudentA")
        super.init(coder: aDecoder)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
