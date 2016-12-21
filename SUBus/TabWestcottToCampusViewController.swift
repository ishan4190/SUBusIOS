//
//  TabWestcottToCampusViewController.swift
//  SUBus
//
//  Created by Ishan Gupta on 11/30/16.
//  Copyright © 2016 Ishan Gupta. All rights reserved.
//

import UIKit

class TabWestcottToCampusViewController : UIViewController,UIPickerViewDataSource, UIPickerViewDelegate{
    
    var obj = WestcottToCampus(name: "bus")
    
    var index: Int=0
    var stopName: String!
    
    
    
    
    @IBOutlet weak var westcottPicker: UIPickerView!
    
    @IBAction func submitWestcott(sender: AnyObject) {
        
         performSegueWithIdentifier("ToCampusSegue", sender:self)
        
    }
    
    
   // var picker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        obj.populate()
        westcottPicker.delegate = self
        westcottPicker.dataSource = self
        //westcottTextField.inputView = picker
    
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
        
        index=row
        //busType = "Westcott"
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return obj.stopNames[row]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let toCampusVC : WestcottToCampusTableViewController = segue.destinationViewController as! WestcottToCampusTableViewController
        
       toCampusVC.stopNameTitle = stopName
        toCampusVC.indexToShow = index
        
    }
}
