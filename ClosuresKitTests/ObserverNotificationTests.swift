//
//  ObserverNotificationTests.swift
//  ClosuresKit
//
//  Created by 卓同学 on 16/4/25.
//  Copyright © 2016年 zhuo. All rights reserved.
//

import XCTest
@testable import ClosuresKit

class ObserverNotificationTests: XCTestCase {

    func testObserverNotification() {
        let notificationName = "Test"
        cs_addNotificationObserverForName(name: "Test", object: nil) { (notification) in
            assert(notification.userInfo!["value"] as! String == "param",#function)
        }
        NSNotificationCenter.defaultCenter().postNotificationName(notificationName, object: self,userInfo:["value":"param"])
    }
}
