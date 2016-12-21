//
//  EastCampusToCampus.swift
//  SU-Bus
//
//  Created by Varun Jindal on 11/30/16.
//  Copyright © 2016 Varun Jindal. All rights reserved.
//

import Foundation
class east_node{
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

class EastToCampus{
    var startTimes = [NSDate]()
    var stopNames = [String]()
    var minFromStart = [Int]()
    var startTimes_str = [String]()
    var data = [[east_node]]()
    var row_temp = [east_node]()
    var name:String
    init(name:String){
        self.name = name
    }
    
    var n1: Int = 0
    var n2: Int = 0
    var end: Int = 0
    func populate(){
        
        stopNames = ["College Place","Day & Flint Halls","Euclid and Westcott","Westcott and Genesee","Genesee and Univ. Ave.","Marshall Street","Henry Street","Bird Library","Comstock & Adams"]
        minFromStart = [0,6,13,15,18,19,28,30,31]
        startTimes_str = ["17:20","18:00","18:40","19:20","20:00","20:40","21:20","22:00","22:40","23:20","00:00","00:40","01:20","02:00"]
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
                let newNode = east_node(stopName: stopNames[j],stopNumber: j)
                newNode.time = NSCalendar.currentCalendar().dateByAddingUnit(.NSMinuteCalendarUnit, value: minFromStart[j], toDate: startTimes[i], options: NSCalendarOptions(rawValue: 0))!
                row_temp.append(newNode)
            }
            data.append(row_temp)
        }
    }
    
    
}
