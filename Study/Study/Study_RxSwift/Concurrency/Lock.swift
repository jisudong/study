//
//  Lock.swift
//  Study
//
//  Created by syswin on 2017/8/1.
//  Copyright © 2017年 syswin. All rights reserved.
//

protocol Lock {
    func lock()
    func unlock()
}

typealias SpinLock = RecursiveLock

extension RecursiveLock : Lock {
    
    @inline(__always)
    final func performLocked(_ action: () -> Void) {
        lock(); defer { unlock() }
        action()
    }
    
    @inline(__always)
    final func calculateLocked<T>(_ action: () -> T) -> T {
        lock()
        defer { unlock() }
        return action()
    }
    
    @inline(__always)
    final func calculateLockedOrFail<T>(_ action: () throws -> T) throws -> T {
        lock()
        defer { unlock() }
        let result = try action()
        return result
    }
}
