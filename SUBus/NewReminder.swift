//
//  NewReminder.swift
//  SUBus
//
//  Created by Varun Jindal on 12/4/16.
//  Copyright © 2016 Ishan Gupta. All rights reserved.
//
import UIKit
import EventKit

class NewReminder: UIViewController {
    
    
    // Properties
    var eventStore: EKEventStore!
    var datePicker: UIDatePicker!


    @IBOutlet weak var reminderTextView: UITextView!
    
    @IBOutlet weak var DateTextField: UITextField!
    
override func viewDidLoad() {
    super.viewDidLoad()
    datePicker = UIDatePicker()
    datePicker.addTarget(self, action: #selector(NewReminder.addDate), forControlEvents: UIControlEvents.ValueChanged)
    
    datePicker.datePickerMode = UIDatePickerMode.DateAndTime
    DateTextField.inputView = datePicker
    reminderTextView.becomeFirstResponder()
}

@IBAction func dismiss(sender: AnyObject) {
    self.dismissViewControllerAnimated(true, completion: nil)
}

    @IBAction func saveNewReminder(sender: AnyObject) {
        let reminder = EKReminder(eventStore: self.eventStore)
        reminder.title = reminderTextView.text
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let dueDateComponents = appDelegate.dateComponentFromNSDate(self.datePicker.date)
        reminder.dueDateComponents = dueDateComponents
        reminder.calendar = self.eventStore.defaultCalendarForNewReminders()
        do {
            try self.eventStore.saveReminder(reminder, commit: true)
            dismissViewControllerAnimated(true, completion: nil)
        }catch{
            print("Error creating and saving new reminder : \(error)")
        }
}

func addDate(){
    self.DateTextField.text = self.datePicker.date.description
}
override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */
}