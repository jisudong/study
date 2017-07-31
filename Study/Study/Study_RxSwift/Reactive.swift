//
//  Reactive.swift
//  Study
//
//  Created by syswin on 2017/7/28.
//  Copyright © 2017年 syswin. All rights reserved.
//

public struct Reactive<Base> {
    
    public let base: Base
    
    public init(_ base: Base) {
        self.base = base
    }
}

public protocol ReactiveCompatible {
    
    associatedtype CompatibleType
    
    static var rx: Reactive<CompatibleType>.Type { get set }
    
    var rx: Reactive<CompatibleType> { get set }
}

extension ReactiveCompatible {
    
    public static var rx: Reactive<Self>.Type {
        get {
            return Reactive<Self>.self
        }
        set {
            
        }
    }
    
    public var rx: Reactive<Self> {
        get {
            return Reactive(self)
        }
        set {
            
        }
    }
}

import class Foundation.NSObject

extension NSObject: ReactiveCompatible {}
