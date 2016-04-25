//
//  UIControlExtension.swift
//  ClosuresKit
//
//  Created by 卓同学 on 16/4/25.
//  Copyright © 2016年 zhuo. All rights reserved.
//

import Foundation

var CSControlEventsHandlerKey = "CSControlEventsHandlerKey"

extension UIControl{
    
    typealias CSEventContainerDict = [String:CSIControlHandlerContainer]
    
    public func cs_addEventHandlerForEvents(event:UIControlEvents,handler:(sender:UIControl)->Void){
        let container = CSIControlHandlerContainer(handler: handler)
        handlers[event.cs_hashValue]=container
        addTarget(container, action: #selector(CSIControlHandlerContainer.invoke(_:)),forControlEvents: event)
    }
    
    var handlers:CSEventContainerDict{
        get{
            if let container = cs_associateValueForKey(&CSControlEventsHandlerKey) as? CSEventContainerDict {
                return container
            }else{
                let container = [String:CSIControlHandlerContainer]()
                cs_associateValue(container, key: &CSControlEventsHandlerKey)
                return container
            }
        }
        set{
            cs_associateValue(newValue, key: &CSControlEventsHandlerKey)
        }
    }
    
}

class CSIControlHandlerContainer:NSObject{
    var handler:(UIControl)->Void = { _ in }

    init(handler:(sender:UIControl)->Void) {
        self.handler = handler
        super.init()
    }
    
    func invoke(sender:UIControl){
        handler(sender)
    }
    
}

extension UIControlEvents{
    var cs_hashValue:String{
        get {
            return String(self)
        }
    }
}