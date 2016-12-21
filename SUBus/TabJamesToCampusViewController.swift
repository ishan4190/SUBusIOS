//
//  TabJamesToCampusViewController.swift
//  SUBus
//
//  Created by Ishan Gupta on 11/30/16.
//  Copyright © 2016 Ishan Gupta. All rights reserved.
//

import UIKit

class TabJamesToCampusViewController : UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    
    
    @IBOutlet weak var jamesPicker: UIPickerView!
   
     var index: Int=0
    var stopName: String!
    var obj = JamesToCampus(name: "bus")
    
    
    @IBAction func submitButtonJames(sender: AnyObject) {
        
        performSegueWithIdentifier("JamesToCampusSegue", sender: self)
    }
    
   // var picker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        obj.populate()
        jamesPicker.delegate = self
        jamesPicker.dataSource = self
        //jamesTextField.inputView = picker
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
        
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return obj.stopNames.count
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        stopName = obj.stopNames[row]
        index = row
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return obj.stopNames[row]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let toCampusJamesVC : JamesToCampusTableViewController = segue.destinationViewController as! JamesToCampusTableViewController
        
        toCampusJamesVC.stopNameTitle = stopName
        toCampusJamesVC.indexToShow = index
        
    }



    
}
