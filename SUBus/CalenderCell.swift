//
//  CalenderCell.swift
//  SUBus
//
//  Created by Varun Jindal on 12/4/16.
//  Copyright © 2016 Ishan Gupta. All rights reserved.
//

//import Foundation
import UIKit

class CalenderCell : UITableViewCell{
    
    @IBOutlet weak var eventName: UILabel!
    
    @IBOutlet weak var eventDate: UILabel!
    //function to set fonts of labels
    func updateLabels() {
        let bodyFont = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        eventName.font = bodyFont
        eventDate.font = bodyFont
        
    }
}