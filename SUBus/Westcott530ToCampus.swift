//
//  Westcott530ToCampus.swift
//  SU-Bus
//
//  Created by Varun Jindal on 11/30/16.
//  Copyright © 2016 Varun Jindal. All rights reserved.
//

import Foundation
class westcott_node{
    var stopName: String = ""
    var stopNumber: Int = 0
    var time: NSDate
    init(stopName: String,stopNumber: Int)
    {
        self.stopName = stopName
        self.stopNumber = stopNumber
        self.time = NSDate.distantPast() as NSDate
    }
}

class WestcottToCampus{
    var startTimes = [NSDate]()
    var stopNames = [String]()
    var minFromStart = [Int]()
    var startTimes_str = [String]()
    var data = [[westcott_node]]()
    var row_temp = [westcott_node]()
    var name:String
    init(name:String){
        self.name = name
    }
    
    var n1: Int = 0
    var n2: Int = 0
    var end: Int = 0
    func populate(){
        
        stopNames = ["E.Genesee and Westcott","Westcott and Euclid","College Place"]
        minFromStart = [0,4,10]
        startTimes_str = ["05:37","06:52","07:22","07:57","08:12","09:17","09:57","11:17","12:22","13:47","14:52","16:12","17:17","23:11"]
        end = startTimes_str.count
        let format = NSDateFormatter()
        format.dateFormat = "HH:mm"
        
        for i in 0...end-1{
            startTimes.append(format.dateFromString(startTimes_str[i])!)
        }
        
        n1 = startTimes.count
        n2 = stopNames.count
        for i in 0...n1-1{
            row_temp.removeAll()
            for j in 0...n2-1{
                let newNode = westcott_node(stopName: stopNames[j],stopNumber: j)
               newNode.time = NSCalendar.currentCalendar().dateByAddingUnit(.NSMinuteCalendarUnit, value: minFromStart[j], toDate: startTimes[i], options: NSCalendarOptions(rawValue: 0))!
                 row_temp.append(newNode)
                
            }
            data.append(row_temp)
        }
        
        
        
    }
    
    
}
