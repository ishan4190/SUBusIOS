//
//  Calender.swift
//  SUBus
//
//  Created by Varun Jindal on 12/4/16.
//  Copyright © 2016 Ishan Gupta. All rights reserved.
//

import Foundation

import UIKit

import EventKit

class CalenderViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet weak var tableView: UITableView!
    var eventStore: EKEventStore!
    var reminders: [EKReminder]!
    
    override func viewWillAppear(animated: Bool) {
        self.eventStore = EKEventStore()
        self.reminders = [EKReminder]()
        self.eventStore.requestAccessToEntityType(EKEntityType.Reminder) { (granted: Bool, error: NSError?) -> Void in
            
            if granted{
                // 2
                let predicate = self.eventStore.predicateForRemindersInCalendars(nil)
                self.eventStore.fetchRemindersMatchingPredicate(predicate, completion: { (reminders: [EKReminder]?) -> Void in
                    
                    self.reminders = reminders
                    dispatch_async(dispatch_get_main_queue()) {
                        self.tableView.reloadData()
                    }
                })
            }else{
                print("The app is not permitted to access reminders, make sure to grant permission in the settings and try again")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.reminders.count
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let reminder: EKReminder = reminders[indexPath.row]
        do{
            try eventStore.removeReminder(reminder, commit: true)
            self.reminders.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }catch{
            print("An error occurred while removing the reminder from the Calendar database: \(error)")
        }        
    }    

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ReminderCell", forIndexPath: indexPath) as! CalenderCell
        let reminder:EKReminder! = self.reminders![indexPath.row]
        cell.eventName.text = reminder.title
        //cell.textLabel?.text = reminder.title
        let formatter:NSDateFormatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let dueDate = reminder.dueDateComponents?.date{
            //cell.detailTextLabel?.text = formatter.stringFromDate(dueDate)
            cell.eventDate.text = formatter.stringFromDate(dueDate)
        }else{
            cell.eventDate.text = "N/A"
        }
        return cell
    }
    
    @IBAction func editTable(sender: AnyObject) {
        tableView.editing = !tableView.editing
        if tableView.editing{
            tableView.setEditing(true, animated: true)
        }else{
            tableView.setEditing(false, animated: true)
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let newReminderVC = segue.destinationViewController as! NewReminder
        newReminderVC.eventStore = eventStore
    }
}