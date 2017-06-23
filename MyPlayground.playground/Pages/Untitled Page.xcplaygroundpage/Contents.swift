//: Playground - noun: a place where people can play

import UIKit



// 单例的四种写法
//final class SingleOne {
//    static let sharedInstance = SingleOne()
//    
//    private init() {}
//}
//
//final class SingleTwo {
//    
//    static func shareSingleTwo() -> SingleTwo
//    {
//        struct Singleton {
//            static var onceToken: dispatch_once_t = 0
//            static var sharedInstance: SingleTwo?
//        }
//        
//        dispatch_once(&Singleton.onceToken) { 
//            Singleton.sharedInstance = SingleTwo()
//        }
//        return Singleton.sharedInstance!
//    }
//    
//    private init() {}
//}
//
//
//private let singleThree = SingleThree()
//final class SingleThree {
//    static var sharedInstance: SingleThree {
//        return singleThree
//    }
//    
//    private init() {}
//}
//
//final class SingleFour {
//    static var sharedIntance: SingleFour {
//        struct Singleton {
//            static let instance: SingleFour = SingleFour()
//        }
//        return Singleton.instance
//    }
//    
//    private init() {}
//}


