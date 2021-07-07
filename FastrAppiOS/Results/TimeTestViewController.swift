//
//  TimeTestViewController.swift
//  FastrAppiOS
//
//  Created by Deepak Kumar on 12/23/19.
//  Copyright © 2019 Deepak Kumar. All rights reserved.
//

import Foundation
import UIKit

class TimeTestViewController : UIViewController {
    
    var pageTitle = "Tap your finger on the button below"
    @IBOutlet weak var pageLabel: UILabel!
    
    override func viewDidLoad() {
        pageLabel.text = pageTitle
    }
    
}
