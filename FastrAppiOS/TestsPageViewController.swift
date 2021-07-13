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
    
    let balanceTestView = BalanceTestViewController()
    let faceTestView = FaceTestViewController()
    let armsTestView = ArmsTestViewController()
    let speakTestView = SpeakTestViewController()
    let timeTestView = TimeTestViewController()
    
    var orderedViewController: [UIViewController] = []
    var currentPageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        balanceTestView.delegate = self
        orderedViewController.append(faceTestView)
        orderedViewController.append(balanceTestView)
        orderedViewController.append(armsTestView)
        orderedViewController.append(timeTestView)
        self.setViewControllers([orderedViewController[0]], direction: UIPageViewController.NavigationDirection.forward, animated: true, completion: nil)
    }
    
}

extension TestsPageViewController : UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
         guard let index = orderedViewController.firstIndex(of: viewController) else {
                   return nil
               }
        if(index == 0){
            return nil;
        }else{
            return orderedViewController[index-1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let index = orderedViewController.firstIndex(of: viewController) else {
            return nil
        }
        if(index == orderedViewController.count - 1){
            return nil;
        }else{
            return orderedViewController[index+1]
        }
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return orderedViewController.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}

extension TestsPageViewController : UIPageViewControllerDelegate {
    
}

extension TestsPageViewController : BalanceTestViewControllerDelegate{
    func didCompleteBalanceTest(hasBalanceChange: Bool) {
        UserDefaults.standard.setValue(hasBalanceChange, forKey: "hasBalanceChange")
        print ("Balance Test Successfully recorded")
    }
}
