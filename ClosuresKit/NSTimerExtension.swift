//
//  NSTimerExtension.swift
//  ClosuresKit
//
//  Created by 卓同学 on 16/4/25.
//  Copyright © 2016年 zhuo. All rights reserved.
//

import Foundation

var CSTimerHandlerKey = "CSTimerHandlerKey"

extension NSTimer{
    public class func cs_timerWithtimeInterval(timeInterval:NSTimeInterval,repeats:Bool,userInfo:NSDictionary?,handler:(timer:NSTimer)->Void)-> NSTimer {
        let timer = NSTimer(timeInterval: timeInterval, target: self, selector: #selector(NSTimer.__csTimerHandler), userInfo: userInfo, repeats: repeats)
        timer.timeHandlerContainer.handler=handler
        return timer
    }
    
    public class func __csTimerHandler(timer:NSTimer){
        timer.timeHandlerContainer.handler(timer: timer)
    }
    
    private var timeHandlerContainer:NSTimerHandlerContainer{
        get{
            if let container = cs_associateValueForKey(&CSTimerHandlerKey) as? NSTimerHandlerContainer {
                return container
            }else{
                let container = NSTimerHandlerContainer()
                cs_associateValue(container, key: &CSTimerHandlerKey)
                return container
            }
        }
    }
}

class NSTimerHandlerContainer:NSObject{
    var handler:(timer:NSTimer)->Void = { _ in }
}