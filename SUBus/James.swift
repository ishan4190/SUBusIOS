//
//  James.swift
//  SU-Bus
//
//  Created by Varun Jindal on 11/21/16.
//  Copyright © 2016 Varun Jindal. All rights reserved.
//

import Foundation
import UIKit
class JamesFromCampus {
    
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
         startTimes_str = ["07:20","08:00","08:45","09:30","10:45","12:15","13:45","15:10","16:00","16:45","17:30","18:10","19:00","19:35","20:10","20:45"]
         end = startTimes_str.count-1
            
            for i in 0...end{
            times.append(format.dateFromString(startTimes_str[i])!)
            }
        
    }

}