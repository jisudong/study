//
//  SynchronizedSubscribeType.swift
//  Study
//
//  Created by syswin on 2017/8/1.
//  Copyright © 2017年 syswin. All rights reserved.
//

protocol SynchronizedSubscribeType: class, ObservableType, Lock {
    
    func _synchronized_subscribe<O: ObserverType>(_ observer: O) -> Disposable where O.E == E
}

extension SynchronizedSubscribeType {
    
    func synchronizedSubscribe<O: ObserverType>(_ observer: O) -> Disposable where O.E == E {
        lock()
        defer { unlock() }
        return _synchronized_subscribe(observer)
    }
}
