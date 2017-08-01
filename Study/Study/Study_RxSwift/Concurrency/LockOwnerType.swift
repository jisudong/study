//
//  LockOwnerType.swift
//  Study
//
//  Created by syswin on 2017/8/1.
//  Copyright © 2017年 syswin. All rights reserved.
//

protocol LockOwnerType: class, Lock {
    var _lock: RecursiveLock { get }
}

extension LockOwnerType {
    func lock() {
        _lock.lock()
    }
    
    func unlock() {
        _lock.unlock()
    }
}
