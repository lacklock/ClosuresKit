//
//  UIGesturePromiseExntension.swift
//  ClosuresKit
//
//  Created by 卓同学 on 16/5/8.
//  Copyright © 2016年 zhuo. All rights reserved.
//

import Foundation

public protocol CSGesturePromisable:class {
    init(target: AnyObject?, action: Selector)
}

private var CSGesturePromisableKey = "CSGesturePromisableKey"

extension CSGesturePromisable where Self:UIGestureRecognizer{
    
    var promise:CSGesturePromise<Self>{
        get{
            return cs_associateValueForKey(&CSGesturePromisableKey) as! CSGesturePromise<Self>
        }
        set{
            cs_associateValue(newValue, key: &CSGesturePromisableKey)
        }
    }
    
    init(@noescape config:(gestureRecognizer:Self)->()={ _ in }){
        typealias Gesture = Self
        let promise=CSGesturePromise<Gesture>()
        self.init(target: promise, action: #selector(CSGesturePromise.gesureRecognizerHandler(_:)))
        self.promise=promise
        config(gestureRecognizer: self)
    }
}

extension UITapGestureRecognizer:CSGesturePromisable{
    
}

extension UILongPressGestureRecognizer:CSGesturePromisable{
    
}

extension UIPanGestureRecognizer:CSGesturePromisable{
    
}

extension UISwipeGestureRecognizer:CSGesturePromisable{
    
}

extension UIRotationGestureRecognizer:CSGesturePromisable{
    
}

extension UIPinchGestureRecognizer:CSGesturePromisable{
    
}

