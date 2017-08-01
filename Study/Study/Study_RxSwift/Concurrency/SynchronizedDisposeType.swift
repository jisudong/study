//
//  SynchronizedDisposeType.swift
//  Study
//
//  Created by syswin on 2017/8/1.
//  Copyright © 2017年 syswin. All rights reserved.
//

protocol SynchronizedDisposeType: class, Disposable, Lock {
    func _synchronized_dispose()
}

extension SynchronizedDisposeType {
    func synchronizedDispose() {
        lock()
        defer { unlock() }
        _synchronized_dispose()
    }
}
