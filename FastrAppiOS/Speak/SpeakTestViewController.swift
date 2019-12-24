//
//  SpeakTestViewController.swift
//  FastrAppiOS
//
//  Created by Deepak Kumar on 12/23/19.
//  Copyright © 2019 Deepak Kumar. All rights reserved.
//

import Foundation
import UIKit

class SpeakTestViewController : UIViewController {
    
    var pageTitle = "Speak Test"
    @IBOutlet weak var pageLabel: UILabel!
    
    override func viewDidLoad() {
        pageLabel.text = pageTitle
    }
}
