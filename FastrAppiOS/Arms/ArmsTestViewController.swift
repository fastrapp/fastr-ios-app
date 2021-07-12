//
//  ArmsTestViewController.swift
//  FastrAppiOS
//
//  Created by Deepak Kumar on 12/23/19.
//  Copyright © 2019 Deepak Kumar. All rights reserved.
//

import Foundation
import UIKit

class ArmsTestViewController : UIViewController {
    
    @IBOutlet weak var pageLabel: UILabel!
    @IBOutlet weak var startButton : UIButton!
    @IBOutlet weak var testButton : UIButton!
    
    //keep track of whether tapping is being done with left versus right hand
    var rightHand = true
    
    //keep track of how many times user has tapped the button
    var tapsCounter = 0
    
    //keep track of how long in between taps
    var tapsInterval = [Double]()
    
    //timer with last tap to get intervals
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 4
        testButton.layer.cornerRadius = 4
        testButton.isHidden = true
        for _ in 0...10{
            tapsInterval.append(-1.0)
        }
    }
    
    @IBAction func onStartButtonTap(sender: UIButton){
        startButton.isHidden = true
        testButton.isHidden = false
    }
    @IBAction func onTestButtonTap (sender: UIButton){
        if tapsCounter < 10 {
            
        }
    }
}
