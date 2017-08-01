//
//  SynchronizedOnType.swift
//  Study
//
//  Created by syswin on 2017/8/1.
//  Copyright © 2017年 syswin. All rights reserved.
//

protocol SynchronizedOnType: class, ObserverType, Lock {
    
    func _synchronized_on(_ event: Event<E>)
}

extension SynchronizedOnType {
    
    func synchronizedOn(_ event: Event<E>) {
        lock()
        defer { unlock() }
        _synchronized_on(event)
    }
}
