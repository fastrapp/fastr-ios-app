//
//  BalanceTestViewController.swift
//  FastrAppiOS
//
//  Created by Jonathan Tiao on 7/6/21.
//  Copyright © 2021 Deepak Kumar. All rights reserved.
//

import Foundation
import UIKit

protocol BalanceTestViewControllerDelegate:class{
    func didCompleteBalanceTest(hasBalanceChange:Bool)
}

class BalanceTestViewController : UIViewController {
    
    var pageTitle = "Have you noticed any changes in your balance?"
    var numNos = 0
    @IBOutlet weak var pageLabel: UILabel!
    weak var delegate:BalanceTestViewControllerDelegate?
    override func viewDidLoad() {
        pageLabel.text = pageTitle
    }
    @IBAction func onYesButtonTap(sender: UIButton){
        delegate?.didCompleteBalanceTest(hasBalanceChange: true)
    }
    @IBAction func onNoButtonTap(sender: UIButton){
        if numNos == 0 {
            pageLabel.text = "If you feel comfortable doing so, please stand up. Did you notice any new difficulty in standing up?"
            numNos += 1
        }
        else if numNos == 1{
            pageLabel.text = "Please walk forward as far as you are comfortable. Does this feel any different than normal for you?"
            numNos += 1
        }
        else if numNos == 2{
            pageLabel.text = "Please close your eyes while standing. Do you feel like you are going to fall over?"
            numNos += 1
        }
        else if (numNos == 3)
        {
        delegate?.didCompleteBalanceTest(hasBalanceChange: false)
        }
    }
    
}

