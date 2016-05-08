//
//  NCGesturePromise.swift
//  NiceGesture
//
//  Created by 卓同学 on 16/4/3.
//  Copyright © 2016年 zhuo. All rights reserved.
//

import UIKit


public class CSGesturePromise<T:UIGestureRecognizer>: NSObject {
    
    public typealias csGestureHandler = (gestureRecognizer:T)->Void

    var beganHandler:csGestureHandler = { _ in }
    var cancelledHandler:csGestureHandler = { _ in }
    var changedHandler:csGestureHandler = { _ in }
    var endedHandler:csGestureHandler = { _ in }
    var failedHandler:csGestureHandler = { _ in }

    
    override init(){
        super.init()
    }
    
    func gesureRecognizerHandler(gestureRecognizer:UIGestureRecognizer){
        switch gestureRecognizer.state {
        case .Began:
            beganHandler(gestureRecognizer: gestureRecognizer as! T)
        case .Cancelled:
            cancelledHandler(gestureRecognizer: gestureRecognizer as! T)
        case .Changed:
            changedHandler(gestureRecognizer: gestureRecognizer as! T)
        case .Ended:
            endedHandler(gestureRecognizer: gestureRecognizer as! T)
        case .Failed:
            failedHandler(gestureRecognizer: gestureRecognizer as! T)
        case .Possible:
            break
        }
    }
    
    /**
     one handler for many states
     
     - parameter states:  UIGestureRecognizerStates
     
     */
    public func whenStatesHappend(states:[UIGestureRecognizerState],handler:csGestureHandler)->CSGesturePromise<T>{
        for state in states{
            switch state {
            case .Began:
                beganHandler=handler
            case .Cancelled:
                cancelledHandler=handler
            case .Changed:
                changedHandler=handler
            case .Ended:
                endedHandler=handler
            case .Failed:
                failedHandler=handler
            case .Possible:
                break
            }
        }
        return self
    }
    
    public func whenBegan(handler:csGestureHandler)->CSGesturePromise<T>{
        beganHandler=handler
        return self
    }
    
    public func whenCancelled(handler:csGestureHandler)->CSGesturePromise<T>{
        cancelledHandler=handler
        return self
    }
    
    public func whenChanged(handler:csGestureHandler)->CSGesturePromise<T>{
        changedHandler=handler
        return self
    }
    
    public func whenEnded(handler:csGestureHandler)->CSGesturePromise<T>{
        endedHandler=handler
        return self
    }
    
    public func whenFailed(handler:csGestureHandler)->CSGesturePromise<T>{
        failedHandler=handler
        return self
    }
    
    
}
