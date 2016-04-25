//
//  NSObjectAssociatedExtension.swift
//  ClosuresKit
//
//  Created by 卓同学 on 16/4/24.
//  Copyright © 2016年 zhuo. All rights reserved.
//

import Foundation

extension NSObject{

    // MARK: - retain
    /**
     Strongly associates an object with the reciever.
     
     */
    public func cs_associateValue(value:AnyObject!,key:UnsafePointer<Void>){
        objc_setAssociatedObject(self, key, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    /**
     Strongly associates an object with the reciever.
     
     */
    public class func cs_associateValue(value:AnyObject!,key:UnsafePointer<Void>){
        objc_setAssociatedObject(self, key, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    /**
     Strongly, thread-safely associates an object with the reciever.
     
     */
    public func cs_atomicallyAssociateValue(value:AnyObject!,key:UnsafePointer<Void>){
        objc_setAssociatedObject(self, key, value, .OBJC_ASSOCIATION_RETAIN)
    }
    
    /**
     Strongly, thread-safely associates an object with the reciever.
     
     */
    public class func cs_atomicallyAssociateValue(value:AnyObject!,key:UnsafePointer<Void>){
        objc_setAssociatedObject(self, key, value, .OBJC_ASSOCIATION_RETAIN)
    }

    // MARK: - copy
    /**
     Associates a copy of an object with the reciever.
     
     */
    public func cs_associateCopyOfValue(value:AnyObject!,key:UnsafePointer<Void>){
        objc_setAssociatedObject(self, key, value, .OBJC_ASSOCIATION_COPY_NONATOMIC)
    }
    
    /**
     Associates a copy of an object with the reciever.
     
     */
    public class func cs_associateCopyOfValue(value:AnyObject!,key:UnsafePointer<Void>){
        objc_setAssociatedObject(self, key, value, .OBJC_ASSOCIATION_COPY_NONATOMIC)
    }
    
    /**
     Thread-safely associates a copy of an object with the reciever.
     
     */
    public func cs_atomicallyAassociateCopyOfValue(value:AnyObject!,key:UnsafePointer<Void>){
        objc_setAssociatedObject(self, key, value, .OBJC_ASSOCIATION_COPY)
    }
    
    /**
     Thread-safely associates a copy of an object with the reciever.
     
     */
    public class func cs_atomicallyAssociateCopyOfValue(value:AnyObject!,key:UnsafePointer<Void>){
        objc_setAssociatedObject(self, key, value, .OBJC_ASSOCIATION_COPY)
    }
    
    // MARK: - weak

    /**
     Weakly associates an object with the reciever.
     
     */
    public func cs_weaklyAssociateValue(value:AnyObject!,key:UnsafePointer<Void>){
        var assocObject = objc_getAssociatedObject(self, key) as? _CSWeakAssociatedObject
        if assocObject == nil {
            assocObject=_CSWeakAssociatedObject()
            cs_associateValue(assocObject, key: key)
        }
        assocObject!.value=value
    }
    
    /**
     Weakly associates an object with the reciever.
     
     */
    public class func cs_weaklyAssociateValue(value:AnyObject!,key:UnsafePointer<Void>){
        var assocObject = objc_getAssociatedObject(self, key) as? _CSWeakAssociatedObject
        if assocObject == nil {
            assocObject=_CSWeakAssociatedObject()
            cs_associateValue(assocObject, key: key)
        }
        assocObject!.value=value
    }
    

// MARK: - get associate Value
    public func cs_associateValueForKey(key:UnsafePointer<Void>)->AnyObject{
        let value = objc_getAssociatedObject(self, key)
        if value != nil && value is _CSWeakAssociatedObject{
            if let _value = (value as! _CSWeakAssociatedObject).value{
                return _value
            }else{
                preconditionFailure("value is nil")
            }
        }
        return value
    }

    public class func cs_associateValueForKey(key:UnsafePointer<Void>)->AnyObject{
        let value = objc_getAssociatedObject(self, key)
        if value != nil && value is _CSWeakAssociatedObject{
            if let _value = (value as! _CSWeakAssociatedObject).value{
                return _value
            }else{
                preconditionFailure("value is nil")
            }
        }
        return value
    }
}

class _CSWeakAssociatedObject:NSObject{
    weak var value:AnyObject?
}
