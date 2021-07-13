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
    @IBOutlet weak var tapsRemainingLabel : UILabel!
    @IBOutlet weak var testLButton: UIButton!
    @IBOutlet weak var testRButton:UIButton!
    //keep track of whether tapping is being done with left versus right hand
    var rightHand = true
    
    //keep track of how many times user has tapped the button
    var tapsCounter = 0
    
    //keep track of how long in between taps
    var rightTapsInterval = [Double]()
    var leftTapsInterval = [Double]()
    
    //timer with last tap to get intervals
    var lastTime:TimeInterval = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 4
        testButton.layer.cornerRadius = 4
        startButton.isHidden = true
        testButton.isHidden = true
        tapsRemainingLabel.isHidden = true
        for _ in 0...10{
            rightTapsInterval.append(-1.0)
            leftTapsInterval.append(-1.0)
        }
        
    }
    
    func initializeTest(){
        startButton.isHidden = false
        testButton.isHidden = false
        testButton.isEnabled = false
        testLButton.isEnabled = false
        testRButton.isEnabled = false
        testLButton.isHidden = true
        testRButton.isHidden = true
        let instrStub = "Tap the Start button, then proceed to tap the Tap Me button as quickly as you can with your"
        if(rightHand){
            pageLabel.text = instrStub + " right thumb"
        }
        else{
            pageLabel.text = instrStub + " left thumb"
        }
    }
    
    func finishTest(){
        tapsCounter = 0
        testLButton.isHidden = false
        testLButton.isEnabled = true
        testRButton.isHidden = false
        testRButton.isEnabled = true
        startButton.isHidden = true
        startButton.isEnabled = true
        testButton.isEnabled = false
        testButton.isHidden = true
        tapsRemainingLabel.isHidden = true
    }
    
    //there has got to be a way to make these one function but i'm not sure how to get the button properties
    @IBAction func onLeftTap(sender:UIButton){
        rightHand = false
        initializeTest()
    }
    @IBAction func onRightTap(sender:UIButton){
        rightHand = true
        initializeTest()
    }
    
    @IBAction func onStartButtonTap(sender: UIButton){
        startButton.isHidden = true
        startButton.isEnabled = false
        testButton.isEnabled = true
        tapsRemainingLabel.isHidden = false
    }
    @IBAction func onTestButtonTap (sender: UIButton){
        
        //zero indexed so to get 10 taps actually need to go up to 9
        if tapsCounter == 0 {
            lastTime = NSDate.timeIntervalSinceReferenceDate
            tapsCounter += 1
        }
        else if tapsCounter < 9 {
            let curTime = Date().timeIntervalSinceReferenceDate
            if rightHand
            {
            rightTapsInterval[tapsCounter] = curTime - lastTime
            }
            else{
                leftTapsInterval[tapsCounter] = curTime - lastTime
            }
            tapsCounter += 1
            lastTime = curTime
        }
        else if tapsCounter == 9 {
            tapsRemainingLabel.text = "All done!"
            finishTest()
        }
        let tapsLeft = 10 - tapsCounter
        tapsRemainingLabel.text = "\(tapsLeft) Taps Left!"
    }
}
