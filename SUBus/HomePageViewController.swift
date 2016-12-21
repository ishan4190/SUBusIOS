//
//  HomePageViewController.swift
//  SUBus
//
//  Created by Ishan Gupta on 11/21/16.
//  Copyright © 2016 Ishan Gupta. All rights reserved.
//

import UIKit

class HomePageViewController : UIViewController {
    
    var font = UIFont (name: "Helvetica Neue", size : 8)!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func CalenderButton(sender: UIButton) {
        performSegueWithIdentifier("CalenderSegue", sender:self)
    }
    
    @IBAction func FromCampus(sender: UIButton) {
      //  prepareForSegue("HomeToTab", )
        performSegueWithIdentifier("HomeToTab", sender:self)
        
    }
    
    @IBAction func TowardsCampus(sender: UIButton) {
        
        performSegueWithIdentifier("HomeToCampus", sender:self)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var images: [UIImage] = []
        for i in 1...12 {
            images.append(UIImage(named: "p\(i)")!)
            
            self.navigationController?.navigationBarHidden = true
            navigationController?.navigationBar.backgroundColor = UIColor.orangeColor()
            UITabBar.appearance().tintColor = UIColor.whiteColor()
           
            UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName:UIFont(name: "Helvetica Neue", size:13)!],forState : .Normal)
            
           // UITabBarItem.appearance().setTitleTextAttributes(NSFontAttributeName:UIFont., forState: <#T##UIControlState#>)
            
        }
      imageView.animationImages = images
       imageView.animationDuration = 10.0
       imageView.startAnimating()
        
       /* for i in 1...4{
        let firstImageView = UIImageView(image: UIImage(named: "p\(i)")!)
        firstImageView.frame = view.frame
        view.addSubview(firstImageView)
        
        imageFadeIn(firstImageView, index: i)
        } */
        
                // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillDisappear(animated: Bool) {
         self.navigationController?.navigationBarHidden = false
    }
    
    override func viewWillAppear(animated: Bool) {
         self.navigationController?.navigationBarHidden = true
    }
    /*func imageFadeIn(imageView: UIImageView, index: Int) {
        
        let secondImageView = UIImageView(image: UIImage(named: "p\(index)")!)
        secondImageView.frame = view.frame
        secondImageView.alpha = 0.0
        
        view.insertSubview(secondImageView, aboveSubview: imageView)
        
        UIView.animateWithDuration(2.0, delay: 2.0, options: .CurveEaseOut, animations: {
            secondImageView.alpha = 1.0
            }, completion: {_ in
                imageView.image = secondImageView.image
                secondImageView.removeFromSuperview()
        })
    } */
}


