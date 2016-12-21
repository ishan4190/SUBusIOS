//
//  JamesToCampus.swift
//  SU-Bus
//
//  Created by Varun Jindal on 11/23/16.
//  Copyright © 2016 Varun Jindal. All rights reserved.
//

import Foundation
class james_node{
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

class JamesToCampus{
    var startTimes = [NSDate]()
    var stopNames = [String]()
    var minFromStart = [Int]()
    var startTimes_str = [String]()
    var data = [[james_node]]()
    var row_temp = [james_node]()
    var name:String
    init(name:String){
        self.name = name
    }
    
    var n1: Int = 0
    var n2: Int = 0
    var end: Int = 0
    func populate(){
        
        stopNames = ["James and Lodi","E. Genesee and Irving","E. Genesee and Univ. Ave.","E.Genesee and Westcott","Westcott and Euclid","College Place"]
        minFromStart = [0,5,6,10,15,20]
        startTimes_str = ["7:00","7:35","8:20","9:00","9:45","11:00","12:30","14:00","15:25","16:15","17:00","17:45","18:25","19:15","19:50","20:15"]
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
            let newNode = james_node(stopName: stopNames[j],stopNumber: j)
                newNode.time = NSCalendar.currentCalendar().dateByAddingUnit(.NSMinuteCalendarUnit, value: minFromStart[j], toDate: startTimes[i], options: NSCalendarOptions(rawValue: 0))!
                row_temp.append(newNode)
            }
            data.append(row_temp)
        }
    }
    
    
}