# ClosuresKit
![Build Status](https://travis-ci.org/lacklock/ClosuresKit.svg)
![Language](https://img.shields.io/badge/language-swift%202.3-orange.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
![License](https://img.shields.io/github/license/mashape/apistatus.svg)

This project is heavily inspired by the popular [BlocksKit](https://github.com/zwaldowski/BlocksKit).

在OC时代，我经常使用[BlocksKit](https://github.com/zwaldowski/BlocksKit)，在RAC引入之前，blockskit让代码优雅了许多。然而swift发布后，因为swift是门强类型语言，不再推荐使用runtime相关的方法。在swift中，如果想使用runtime的有些特性需要特别的声明比如@objc这样。由此，blockskit并没有swift版本。然而，即使去掉了runtime的一些东西，blockskit也有一些扩展的方法很实用。所以，我就自己写了一些能想到能做到的贴近blockskit的常见方法：[ClosuresKit](https://github.com/lacklock/ClosuresKit)。
主要有以下3个部分的扩展
###Foundation
####集合类型增加了几个判断
- cs_match
根据传入的闭包找出匹配的一条数据，filter返回的是一个集合，match只返回一条数据，这是区别。示例如下：
```swift
    let testSequence = [2,5,6,9]
  
    func testMatch() {
        let result = testSequence.cs_match { (value) -> Bool in
            return value == 5
        }
        assert(result==5,"match failed")
    }

```
- cs_any
参数和前面一样，返回的是布尔值，通过传入的闭包判断是否集合中有数据符合这个闭包。
- cs_all
参数和前面一样，返回的是布尔值，通过传入的闭包判断是否集合中**所有**数据符合这个闭包。
- cs_none
参数和前面一样，返回的是布尔值，通过传入的闭包判断是否集合中**没有任何一条**数据符合这个闭包。

####NSObject可以方便的关联对象
封装了NSObject的<code>objc_setAssociatedObject</code>的方法。
几个api的区别也就是关联的策略不同，比如reatian、copy、weak等。
```swift
class AssocaitedObjectTests: XCTestCase {
    static var identifier = "identifier"

    func testCopyAssociateValue(){
        let test:NSMutableString="first"
        let view = UIView()
        view.cs_associateCopyOfValue(test, key: &AssocaitedObjectTests.identifier)
        test.appendString("t")
        let result = view.cs_associateValueForKey(&AssocaitedObjectTests.identifier) as! NSString
        assert(result=="first","CopyAssociateValue failed")
    }
    
}
```
这是单元测试中写的一个关联对象策略用copy的示例代码。
####通知
可以通过<code>cs_addNotificationObserverForName</code>方便的添加对某个通知的处理:
```swift
 func testObserverNotification() {
        let notificationName = "Test"
        cs_addNotificationObserverForName(name: "Test", object: nil) { (notification) in
            assert(notification.userInfo!["value"] as! String == "param",#function)
        }
        NSNotificationCenter.defaultCenter().postNotificationName(notificationName, object: self,userInfo:["value":"param"])
    }

```
####NSTimer
可以在添加timer时传入闭包直接处理回调。示例代码：
```swift
    var count=0
    var timer:NSTimer?

    func testTimerWithtimeInterval() {
        timer = NSTimer.cs_scheduledTimerWithTimeInterval(1, repeats: false, userInfo: ["key":"value"]) {[unowned self] (timer) in
            assert(timer.userInfo!["key"]=="value", #function)
            print("times:\(self.count)")
        }
        timer!.fire()
    }
```
###UIKIt
给UIControl加了一个方便处理UIControlEvents的方法<code>cs_addEventHandlerForEvents</code>，示例如下：
```swift
   btn.cs_addEventHandlerForEvents(.TouchUpInside) { (sender) in
            print("TouchUpInside")
        }
```
###UIGesture
可以给UIView方便的直接添加手势，支持链式编程，可以在添加手势时那个闭包里配置，连续处理几种不同的状态：
```swift
     label.cs_addPanGesture { (gestureRecognizer) in
            gestureRecognizer.maximumNumberOfTouches=2
        }.whenBegan { (gestureRecognizer) in
            print("began")
        }
```
如果不用配置，配置的闭包可以直接为空：
```swift
       label.cs_addPanGesture().whenChanged { (gestureRecognizer) in
            print("changed")
        }
```
也可以同时给几个状态添加同一个处理闭包：
```swift
lbState.nc_addPanGesture().whenStatesHappend([.Ended,.Changed]) { (gestureRecognizer) -> Void in
            
        }
```
还给tap和swipe添加了两个快捷的处理方法：
```swift
    label.cs_whenTapped { (tapGestureRecognizer) in
            print("tapped")
        }
        
     view.cs_whenSwipedInDirection(.Down) { (gestureRecognizer) in
            print("down")
        }
```
目前想到的api就这些，如果有需要添加的可以直接提到issue里，我会及时处理的，也欢迎直接提pull request。

#Installation

###Carthage
<code>github "lacklock/ClosuresKit"</code>

#Contact

Weibo : [@没故事的卓同学](http://weibo.com/1926303682)

# License

`ClosuresKit` is available under the MIT license. See the [LICENSE](./LICENSE) file for more info.