//
//  AssocaitedObjectTests.swift
//  ClosuresKit
//
//  Created by 卓同学 on 16/4/24.
//  Copyright © 2016年 zhuo. All rights reserved.
//

import XCTest
@testable import ClosuresKit

class AssocaitedObjectTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    static var identifier = "identifier"
    static var identifierCompare = "identifierCompare"
    let testString = "test"

    func testAssociateValue() {
        let view = UIView()
        view.cs_associateValue(testString, key: &AssocaitedObjectTests.identifier)
        view.cs_associateValue(testString, key: &AssocaitedObjectTests.identifierCompare)
        let result = view.cs_associateValueForKey(&AssocaitedObjectTests.identifier) as! String
        assert(result==testString,"associateValue failed")

    }
    
    func testClassAssociateValue() {
        UIView.cs_associateValue(testString, key: &AssocaitedObjectTests.identifier)
        let result = UIView.cs_associateValueForKey(&AssocaitedObjectTests.identifier) as! String
        assert(result==testString,"class associateValue failed")
    }

    func testCopyAssociateValue(){
        let test:NSMutableString="first"
        let view = UIView()
        view.cs_associateCopyOfValue(test, key: &AssocaitedObjectTests.identifier)
        test.appendString("t")
        let result = view.cs_associateValueForKey(&AssocaitedObjectTests.identifier) as! NSString
        assert(result=="first","CopyAssociateValue failed")

    }
}
