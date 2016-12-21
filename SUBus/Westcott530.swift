//
//  Westcott530.swift
//  SU-Bus
//
//  Created by Varun Jindal on 11/21/16.
//  Copyright © 2016 Varun Jindal. All rights reserved.
//

import Foundation
import UIKit
class WestcottFromCampus {
    var name:String
    init(name:String){
        self.name = name
    }
    var startTimes_str = [String]()
    var end:Int = 0
    var times = [NSDate]()
    func test(){
        let format = NSDateFormatter()
        format.dateFormat = "HH:mm"
        startTimes_str = ["05:47","07:02","07:32","08:07","08:22","09:27","10:07","11:27","12:32","13:57","15:02","16:22","17:27","23:20"]
        end = startTimes_str.count-1
        for i in 0...end{
            times.append(format.dateFromString(startTimes_str[i])!)
        }
        
    }
}
