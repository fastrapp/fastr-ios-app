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
    @IBOutlet weak var pageLabel: UILabel!
    weak var delegate:BalanceTestViewControllerDelegate?
    override func viewDidLoad() {
        pageLabel.text = pageTitle
    }
    @IBAction func onYesButtonTap(sender: UIButton){
        delegate?.didCompleteBalanceTest(hasBalanceChange: true)
    }
    @IBAction func onNoButtonTap(sender: UIButton){
        delegate?.didCompleteBalanceTest(hasBalanceChange: false)
    }
    
}

