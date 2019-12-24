//
//  FaceViewController.swift
//  FastrAppiOS
//
//  Created by Deepak Kumar on 12/10/19.
//  Copyright © 2019 Deepak Kumar. All rights reserved.
//

import Foundation
import UIKit

class FaceTestViewController : UIViewController {
    
    @IBOutlet weak var pageLabel: UILabel!
    var pageTitle = "Face"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageLabel.text = pageTitle
    }
    
}
