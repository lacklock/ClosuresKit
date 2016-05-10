//
//  GestureUIViewExtension.swift
//  ClosuresKit
//
//  Created by 卓同学 on 16/5/9.
//  Copyright © 2016年 zhuo. All rights reserved.
//

import Foundation

public extension UIView{
    
    public func cs_addTapGesture(@noescape config:(gestureRecognizer:UITapGestureRecognizer)->()={ _ in })->CSGesturePromise<UITapGestureRecognizer>{
        let recognizer = UITapGestureRecognizer(config: config)
        addGestureRecognizer(recognizer)
        return recognizer.promise
    }
    
    public func cs_whenTapped(handler:(tapGestureRecognizer:UITapGestureRecognizer)->()){
        cs_addTapGesture().whenEnded(handler)
    }
    
    public func cs_addLongPressGesture(@noescape config:(gestureRecognizer:UILongPressGestureRecognizer)->()={ _ in })->CSGesturePromise<UILongPressGestureRecognizer>{
        let recognizer = UILongPressGestureRecognizer(config: config)
        addGestureRecognizer(recognizer)
        return recognizer.promise
    }
  
    public func cs_addPanGesture(@noescape config:(gestureRecognizer:UIPanGestureRecognizer)->()={ _ in })->CSGesturePromise<UIPanGestureRecognizer>{
        let recognizer = UIPanGestureRecognizer(config: config)
        addGestureRecognizer(recognizer)
        return recognizer.promise
    }
    
    public func cs_addSwipeGesture(@noescape config:(gestureRecognizer:UISwipeGestureRecognizer)->()={ _ in })->CSGesturePromise<UISwipeGestureRecognizer>{
        let recognizer = UISwipeGestureRecognizer(config: config)
        addGestureRecognizer(recognizer)
        return recognizer.promise
    }
    
    public func cs_whenSwipedInDirection(direction:UISwipeGestureRecognizerDirection,gestureRecognizer:(gestureRecognizer:UISwipeGestureRecognizer)->()){
        cs_addSwipeGesture { (swipeGestureRecognizer) in
            swipeGestureRecognizer.direction=direction
            }.whenEnded(gestureRecognizer)
    }
    
    public func cs_addPinchGesture(@noescape config:(gestureRecognizer:UIPinchGestureRecognizer)->()={ _ in })->CSGesturePromise<UIPinchGestureRecognizer>{
        let recognizer = UIPinchGestureRecognizer(config: config)
        addGestureRecognizer(recognizer)
        return recognizer.promise
    }
    
    public func cs_addRotationGesture(@noescape config:(gestureRecognizer:UIRotationGestureRecognizer)->()={ _ in })->CSGesturePromise<UIRotationGestureRecognizer>{
        let recognizer = UIRotationGestureRecognizer(config: config)
        addGestureRecognizer(recognizer)
        return recognizer.promise
    }
    
    public func cs_addScreenEdgePanGesture(@noescape config:(gestureRecognizer:UIScreenEdgePanGestureRecognizer)->()={ _ in })->CSGesturePromise<UIScreenEdgePanGestureRecognizer>{
        let recognizer = UIScreenEdgePanGestureRecognizer(config: config)
        addGestureRecognizer(recognizer)
        return recognizer.promise
    }
}