//
//  EastCampus.swift
//  SU-Bus
//
//  Created by Varun Jindal on 11/21/16.
//  Copyright © 2016 Varun Jindal. All rights reserved.
//

import Foundation
import UIKit
class EastFromCampus {
    
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
        startTimes_str = ["17:20","18:00","18:40","19:20","20:00","20:40","21:20","22:00","22:40","23:20","00:00","00:40","01:20","02:00"]
        end = startTimes_str.count-1
        for i in 0...end{
            times.append(format.dateFromString(startTimes_str[i])!)
        }
        
    }
    
}
