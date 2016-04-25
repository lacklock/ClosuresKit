//
//  TimerTests.swift
//  ClosuresKit
//
//  Created by 卓同学 on 16/4/25.
//  Copyright © 2016年 zhuo. All rights reserved.
//

import XCTest
@testable import ClosuresKit

class TimerTests: XCTestCase {

    var count=0
    var timer:NSTimer?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testExample() {
        timer = NSTimer.cs_timerWithtimeInterval(1, repeats: false, userInfo: ["key":"value"]) {[unowned self] (timer) in
            assert(timer.userInfo!["key"]=="value", #function)
            print("times:\(self.count)")
        }
        timer!.fire()
    }

}
