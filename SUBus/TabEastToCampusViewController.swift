//
//  TabEastToCampusViewController.swift
//  SUBus
//
//  Created by Ishan Gupta on 11/30/16.
//  Copyright © 2016 Ishan Gupta. All rights reserved.
//

import UIKit

class TabEastToCampusViewController : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    var obj = EastToCampus(name: "bus")
     var index: Int=0   //EastToCampusSegue
   
    var stopName : String!
    
    @IBOutlet weak var eastCampusPicker: UIPickerView!
    
    
    @IBAction func submitButtonEast(sender: AnyObject) {
        
        performSegueWithIdentifier("EastToCampusSegue", sender: self)
    }
    //var picker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        obj.populate()
        eastCampusPicker.delegate = self
        eastCampusPicker.dataSource = self
        //eastTextField.inputView = picker
        
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
       // eastTextField.text = obj.stopNames[row]
        index = row
        stopName = obj.stopNames[row]
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return obj.stopNames[row]
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let toCampusEastVC : EastToCampusTableViewController = segue.destinationViewController as! EastToCampusTableViewController
        toCampusEastVC.stopNameTitle = stopName
        toCampusEastVC.indexToShow = index
        
        
    }

}
