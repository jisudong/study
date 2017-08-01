//
//  RxMutableBox.swift
//  Study
//
//  Created by syswin on 2017/7/28.
//  Copyright © 2017年 syswin. All rights reserved.
//


final class RxMutableBox<T> : CustomDebugStringConvertible {
    
    var value: T
    
    init(_ value: T) {
        self.value = value
    }
}

extension RxMutableBox {
    var debugDescription: String {
        return "MutableBox(\(self.value))"
    }
}
