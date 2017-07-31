//
//  Cancelable.swift
//  Study
//
//  Created by syswin on 2017/7/27.
//  Copyright © 2017年 syswin. All rights reserved.
//

public protocol Cancelable : Disposable {
    var isDisposed: Bool { get }
}
