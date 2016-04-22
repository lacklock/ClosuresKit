//
//  SequenceTypeExtension.swift
//  ClosuresKit
//
//  Created by 卓同学 on 16/4/22.
//  Copyright © 2016年 zhuo. All rights reserved.
//

import Foundation

extension SequenceType{
    
    /**
     loops through sequeence to find the match element
     it's will stop and return on the first match
     if thers isn't any element match, return nil
     */
    public func cs_match(@noescape condition:(Self.Generator.Element) throws -> Bool) rethrows -> Self.Generator.Element?{
        for element in self {
            if try condition(element) {
                return element
            }
        }
        return nil
    }
}