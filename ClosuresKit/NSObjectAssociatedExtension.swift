//
//  NSObjectAssociatedExtension.swift
//  ClosuresKit
//
//  Created by 卓同学 on 16/4/24.
//  Copyright © 2016年 zhuo. All rights reserved.
//

import Foundation

extension NSObject{

    // MARK: - retian
    /**
     Strongly associates an object with the reciever.
     
     */
    public func cs_associateValue(value:AnyObject!,key:UnsafePointer<Void>){
        objc_setAssociatedObject(self, key, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    /**
     Strongly associates an object with the reciever.
     
     */
    public class func cs_associateValue(value:AnyObject!,inout key:String){
        objc_setAssociatedObject(self, key, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    /**
     Strongly, thread-safely associates an object with the reciever.
     
     */
    public func cs_atomicallyAssociateValue(value:AnyObject!,inout key:String){
        objc_setAssociatedObject(self, key, value, .OBJC_ASSOCIATION_RETAIN)
    }
    
    /**
     Strongly, thread-safely associates an object with the reciever.
     
     */
    public class func cs_atomicallyAssociateValue(value:AnyObject!,inout key:String){
        objc_setAssociatedObject(self, key, value, .OBJC_ASSOCIATION_RETAIN)
    }

    // MARK: - copy
    /**
     Associates a copy of an object with the reciever.
     
     */
    public func cs_associateCopyOfValue(value:AnyObject!,inout key:String){
        objc_setAssociatedObject(self, key, value, .OBJC_ASSOCIATION_COPY_NONATOMIC)
    }
    
    /**
     Associates a copy of an object with the reciever.
     
     */
    public class func cs_associateCopyOfValue(value:AnyObject!,inout key:String){
        objc_setAssociatedObject(self, key, value, .OBJC_ASSOCIATION_COPY_NONATOMIC)
    }
    
    /**
     Thread-safely associates a copy of an object with the reciever.
     
     */
    public func cs_atomicallyAassociateCopyOfValue(value:AnyObject!,inout key:String){
        objc_setAssociatedObject(self, key, value, .OBJC_ASSOCIATION_COPY)
    }
    
    /**
     Thread-safely associates a copy of an object with the reciever.
     
     */
    public class func cs_atomicallyAssociateCopyOfValue(value:AnyObject!,inout key:String){
        objc_setAssociatedObject(self, key, value, .OBJC_ASSOCIATION_COPY)
    }
    
//    /**
//     Weakly associates an object with the reciever.
//     
//     */
//    public func cs_weaklyAssociateValue(value:AnyObject!,inout key:String){
//        var assocObject = objc_getAssociatedObject(self, key) as? _CSWeakAssociatedObject
//        if assocObject == nil {
//            assocObject=_CSWeakAssociatedObject()
//            cs_associateValue(assocObject, key: &key)
//        }
//        assocObject!.value=value
//    }
    

// MARK: - get associate Value
    public func cs_associateValueForKey(key:UnsafePointer<Void>)->AnyObject{
        return objc_getAssociatedObject(self, key)
    }

    public class func cs_associateValueForKey(inout key:String)->AnyObject{
        return objc_getAssociatedObject(self, key)
    }
}

class _CSWeakAssociatedObject:NSObject{
    weak var value:AnyObject?
}
