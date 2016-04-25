//
//  ViewController.swift
//  ClosuresTest
//
//  Created by 卓同学 on 16/4/25.
//  Copyright © 2016年 zhuo. All rights reserved.
//

import UIKit
import ClosuresKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let timer = NSTimer.cs_scheduledTimerWithTimeInterval(0.5, repeats: false, userInfo: nil) { (timer) in
            print("\(Int(NSDate().timeIntervalSince1970))")
        }
        timer.fire()
    }

}

