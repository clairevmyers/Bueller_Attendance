//
//  tableCell.swift
//  Bueller Attendance
//
//  Created by Grace Hansen on 1/19/18.
//  Copyright © 2018 District196. All rights reserved.
//

import UIKit

class tableCell: UITableViewCell {
    
    var labels: [String: (Label: UILabel, x: Int, y: Int, width: Int, height: Int)] = ["text": (UILabel(), 40, 0, 300, 40),]
    
    //Adds elements as a subView to the contentView
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        for(_, value) in labels
        {
            self.contentView.addSubview(value.Label)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }
    
    //Set element sizes
    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
        func layoutSubviews()
        {
            super.layoutSubviews()
            for(_, val) in labels
            {
                val.Label.frame = CGRect(x: val.x, y: val.y, width: val.width, height: val.height)
            }
        }
    }
    
}

