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
        let timer = NSTimer.cs_timerWithtimeInterval(0.5, repeats: true, userInfo: nil) { (timer) in
            print("\(Int(NSDate().timeIntervalSince1970))")
        }
        timer.fire()
    }

}

