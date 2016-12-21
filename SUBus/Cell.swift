//
//  Cell.swift
//  SU-Bus
//
//  Created by Varun Jindal on 11/21/16.
//  Copyright © 2016 Varun Jindal. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    @IBOutlet var busNameLabel: UILabel!
    @IBOutlet var time: UILabel!
    
    
    //function to set fonts of labels
    func updateLabels() {
        let bodyFont = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        busNameLabel.font = bodyFont
        time.font = bodyFont
       
    }
    
}

