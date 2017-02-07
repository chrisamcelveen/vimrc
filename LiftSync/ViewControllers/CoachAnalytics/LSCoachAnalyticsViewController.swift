//
//  LSCoachAnalyticsViewController.swift
//  LiftSync
//
//  Created by Anton Dolzhenko on 07.02.17.
//  Copyright © 2017 Onix-Systems. All rights reserved.
//

import UIKit

final class LSCoachAnalyticsViewController: UIViewController {

//    var pageViewController: UIPageViewController?
    fileprivate var segmentedControl: UISegmentedControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTitleSegmentControl()
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        self.view = UIView(frame: UIScreen.main.bounds)
        self.view.backgroundColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configTitleSegmentControl() {
//        self.title = nil;
        self.title = nil
        //titles will be taken from controllers
        segmentedControl = UISegmentedControl(items: ["Team","Group","Athlete"])
        segmentedControl?.selectedSegmentIndex = 0
        self.navigationItem.titleView = segmentedControl
    }
}
