//
//  StudentCell.swift
//  Bueller Attendance
//
//  Created by Grace Hansen on 2/23/18.
//  Copyright © 2018 District196. All rights reserved.
//

import UIKit

class StudentCell: UITableViewCell {
    
    @IBOutlet weak var First: UILabel!
    @IBOutlet weak var Last: UILabel!
    @IBOutlet weak var ID: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}


