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
    
    var pageTitle = "Arms Test"
    
    @IBOutlet weak var pageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageLabel.text = pageTitle
    }
    
}
