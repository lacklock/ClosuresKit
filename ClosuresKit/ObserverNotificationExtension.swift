//
//  ObserverNotificationExtension.swift
//  ClosuresKit
//
//  Created by 卓同学 on 16/4/25.
//  Copyright © 2016年 zhuo. All rights reserved.
//

import Foundation

var CSNotificationHandlersKey = "CSNotificationHandlers"

extension NSObject{
    
    public typealias csNotificationHandler = (notification:NSNotification)->Void
    
    public func cs_addNotificationObserverForName(name aName: String, object anObject: AnyObject?,handler:csNotificationHandler){
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(NSObject.notificationHandler(_:)), name: aName, object: anObject)
        csNotificationHandlers[aName]=handler
    }
    
    public func cs_removeNotificationObserverForName(name aName:String){
        NSNotificationCenter.defaultCenter().removeObserver(self, name: aName, object: nil)
    }
    
    func notificationHandler(notification:NSNotification){
        if let handler = csNotificationHandlers[notification.name]{
            handler(notification: notification)
        }
    }
    
    // MARK: - computed propery
    private var csNotificationHandlers:[String:csNotificationHandler]{
        get{
            return handlerContainer.handlers
        }
        set{
            handlerContainer.handlers=newValue
        }
    }
    
    private var handlerContainer:NotificationHandlerContainer{
        get{
            if let container = cs_associateValueForKey(&CSNotificationHandlersKey) as? NotificationHandlerContainer {
                return container
            }else{
                let container = NotificationHandlerContainer()
                cs_associateValue(container, key: &CSNotificationHandlersKey)
                return container
            }
        }
    }
    
}

class NotificationHandlerContainer:NSObject{
    var handlers=[String:csNotificationHandler]()
}