//
//  UIControlViewController.swift
//  ClosuresKit
//
//  Created by 卓同学 on 16/4/25.
//  Copyright © 2016年 zhuo. All rights reserved.
//

import UIKit
import ClosuresKit

class UIControlViewController: UIViewController {
    
    @IBOutlet weak var btn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        btn.cs_addEventHandlerForEvents(.TouchUpInside) { (sender) in
            print("TouchUpInside")
        }
        btn.cs_addEventHandlerForEvents(.TouchDown) { (sender) in
            print("TouchDown")
        }
    }


}
