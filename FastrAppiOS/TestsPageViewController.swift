//
//  TestsPageViewController.swift
//  FastrAppiOS
//
//  Created by Deepak Kumar on 12/16/19.
//  Copyright © 2019 Deepak Kumar. All rights reserved.
//

import Foundation
import UIKit

class TestsPageViewController : UIPageViewController {

    var orderedViewController: [UIViewController] = [FaceTestViewController(),
                                                     ArmsTestViewController(),
                                                     SpeakTestViewController(),
                                                     TimeTestViewController()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        self.setViewControllers([orderedViewController[0]], direction: UIPageViewController.NavigationDirection.forward, animated: true, completion: nil)
    }
    
}

extension TestsPageViewController : UIPageViewControllerDataSource {
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let index = orderedViewController.firstIndex(of: viewController) else {
            return nil
        }
        let indexToShow = (index + 1 == orderedViewController.count) ? orderedViewController.count - 1 : index + 1
        
        return orderedViewController[indexToShow]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
         guard let index = orderedViewController.firstIndex(of: viewController) else {
                   return nil
               }
               
        return orderedViewController[index]
    }
}

extension TestsPageViewController : UIPageViewControllerDelegate {
    
}
