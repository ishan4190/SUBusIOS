//
//  Item.swift
//  SU-Bus
//
//  Created by Varun Jindal on 11/21/16.
//  Copyright © 2016 Varun Jindal. All rights reserved.
//

import Foundation
import UIKit

class Item: NSObject{
    var busName: String
    var time: NSDate
    
    init(busName: String, time: NSDate) {
        self.busName = busName
        self.time = time
    }
}