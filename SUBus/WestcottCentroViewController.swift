//
//  WestcottCentroViewController.swift
//  SUBus
//
//  Created by Ishan Gupta on 11/21/16.
//  Copyright © 2016 Ishan Gupta. All rights reserved.
//

import UIKit

class WestcottCentroViewController : UITableViewController {
    var dataWestcott = WestcottFromCampus(name: "bus")
    override func viewDidLoad() {
        super.viewDidLoad()
        dataWestcott.test()
        //set contentInset for tableView
        //let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
       // let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
       // tableView.contentInset = insets
        print("\(dataWestcott.times.count)")
        
        
        self.tabBarController?.navigationItem.title = "College Place"
        
        tableView.estimatedRowHeight = 65
        // Do any additional setup after loading the view, typically from a nib.
        
           }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //function to get the number of rows in a given section of a table view. This is a REQUIRED function
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataWestcott.times.count
        
    }
    
    //function to get the number of sections in the table view.
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    //function to get a cell for inserting in a particular location of the table view. This is a REQUIRED function
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //print("Getting cell for Section: \(indexPath.section) Row: \(indexPath.row)")
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell", forIndexPath: indexPath) as! Cell
        
        cell.updateLabels() //sets the fonts of the labels
        
        
        let item = dataWestcott.times[indexPath.row]
        cell.busNameLabel.text = "Westcott 530"
        
        // let dateformatter = NSDateFormatter()
        
        // dateformatter.dateStyle = NSDateFormatterStyle.ShortStyle
        
        // dateformatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        let dateformatter = NSDateFormatter()
        dateformatter.dateFormat = "HH:mm"
        
        let now = dateformatter.stringFromDate(item)
        
        cell.time.text = now
        
        
        return cell
        
    }
    
    
}
