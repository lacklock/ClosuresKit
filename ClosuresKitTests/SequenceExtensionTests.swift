//
//  SequenceExtensionTests.swift
//  ClosuresKit
//
//  Created by 卓同学 on 16/4/22.
//  Copyright © 2016年 zhuo. All rights reserved.
//

import XCTest
@testable import ClosuresKit

class SequenceExtensionTests: XCTestCase {
    
    let testSequence = [2,5,6,9]
    
    func testMatch() {
        let result = testSequence.cs_match { (value) -> Bool in
            return value == 5
        }
        assert(result==5,"match failed")
    }
    
    func testAny() {
        let result = testSequence.cs_any { (value) -> Bool in
            return value > 10
        }
        assert(result == false, "any failed")
    }
}
