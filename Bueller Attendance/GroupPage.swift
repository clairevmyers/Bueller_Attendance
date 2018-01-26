//
//  GroupPage.swift
//  Bueller Attendance
//
//  Created by MYERS, CLAIRE on 1/18/18.
//  Copyright © 2018 District196. All rights reserved.
//

import UIKit

class GroupPage: UIViewController {

    @IBOutlet weak var Stepperlabel: UILabel!
    
    @IBAction func stepper(_ sender: UIStepper) {
        //Stepperlabel.txt = Sting(sender.value)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
