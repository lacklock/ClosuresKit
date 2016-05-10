//
//  UIGestureViewController.swift
//  ClosuresKit
//
//  Created by 卓同学 on 16/5/9.
//  Copyright © 2016年 zhuo. All rights reserved.
//

import UIKit
import ClosuresKit

class UIGestureViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.cs_whenTapped { (tapGestureRecognizer) in
            print("tapped")
        }
        
        view.cs_whenSwipedInDirection(.Down) { (gestureRecognizer) in
            print("down")
        }
    }

}
