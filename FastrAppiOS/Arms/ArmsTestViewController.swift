//
//  ArmsTestViewController.swift
//  FastrAppiOS
//
//  Created by Deepak Kumar on 12/23/19.
//  Copyright © 2019 Deepak Kumar. All rights reserved.
//

import Foundation
import UIKit

protocol ArmsTestViewControllerDelegate:class{
    func didCompleteLeftHandTest(leftFingerTaps:[Double])
    func didCompleteRightHandTest(rightFingerTaps:[Double])
}

class ArmsTestViewController : UIViewController {
    
    @IBOutlet weak var pageLabel: UILabel!
    @IBOutlet weak var startButton : UIButton!
    @IBOutlet weak var testButton : UIButton!
    @IBOutlet weak var tapsRemainingLabel : UILabel!
    @IBOutlet weak var testLButton: UIButton!
    @IBOutlet weak var testRButton:UIButton!
    
    weak var delegate:ArmsTestViewControllerDelegate?
    //keep track of whether tapping is being done with left versus right hand
    var rightHand = false
    //var leftHand = false
    //keep track of how many times user has tapped the button
    var tapsCounter = 0
    
    //need to record 10 taps, but this gives us a buffer
    //ignore the first 3 taps
    let numGoalTaps = 15
    let numIgnore = 3
    
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
        startButton.showsTouchWhenHighlighted = true
        testButton.showsTouchWhenHighlighted = true
        testLButton.showsTouchWhenHighlighted = true
        testRButton.showsTouchWhenHighlighted = true
        tapsRemainingLabel.isHidden = true
        for _ in 0...10{
            rightTapsInterval.append(-1.0)
            leftTapsInterval.append(-1.0)
        }
        
    }
    func updateLabel(){
        let instrStub = "Tap the Start button, then proceed to tap the Tap Me button as quickly as you can with your"
        if(rightHand){
            pageLabel.text = instrStub + " RIGHT thumb"
        }
        else{
            pageLabel.text = instrStub + " LEFT thumb"
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
        updateLabel()
    }
    
    func finishTest(){
        tapsCounter = 0
        if rightHand{
            delegate?.didCompleteRightHandTest(rightFingerTaps: rightTapsInterval)
            testRButton.isEnabled = false
            testRButton.isHidden = true
            testLButton.isEnabled = true
            testLButton.isHidden = false
            rightHand = false
        }
        else{
            delegate?.didCompleteLeftHandTest(leftFingerTaps: leftTapsInterval)
            testLButton.isEnabled = false
            testLButton.isHidden = true
            testRButton.isEnabled = true
            testRButton.isHidden = false
            rightHand = true
        }
        
        startButton.isHidden = true
        startButton.isEnabled = true
        testButton.isEnabled = false
        testButton.isHidden = true
        tapsRemainingLabel.isHidden = true
        updateLabel()
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
        tapsRemainingLabel.text = "15 Taps Left!"
        tapsRemainingLabel.isHidden = false
    }
    @IBAction func onTestButtonTap (sender: UIButton){
        
        //ignore the first couple of taps and the last couple
        let curTime = Date().timeIntervalSinceReferenceDate
        if tapsCounter < numGoalTaps - 1 && tapsCounter >= numIgnore && tapsCounter - numIgnore < rightTapsInterval.count {
            let index = tapsCounter - numIgnore
            
            if rightHand
            {
                rightTapsInterval[index] = curTime - lastTime
            }
            else{
                leftTapsInterval[index] = curTime - lastTime
            }

        }
        tapsCounter += 1
        let tapsLeft = numGoalTaps - tapsCounter
        tapsRemainingLabel.text = "\(tapsLeft) Taps Left!"
        lastTime = curTime
        
        if tapsCounter == numGoalTaps{
            tapsRemainingLabel.text = "All done!"
            finishTest()
        }
    }
}
