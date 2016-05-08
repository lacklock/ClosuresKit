//
//  GestureUIViewExtension.swift
//  ClosuresKit
//
//  Created by 卓同学 on 16/5/9.
//  Copyright © 2016年 zhuo. All rights reserved.
//

import Foundation

public extension UIView{
    
    public func cs_addTapGestureWithConfigClosure(@noescape config:(tapGestureRecognizer:UITapGestureRecognizer)->())->CSGesturePromise<UITapGestureRecognizer>{
        let recognizer = UITapGestureRecognizer(config: config)
        addGestureRecognizer(recognizer)
        return recognizer.promise
    }
    
}