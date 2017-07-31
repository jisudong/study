//
//  ImmediateSchedulerType.swift
//  Study
//
//  Created by syswin on 2017/7/28.
//  Copyright © 2017年 syswin. All rights reserved.
//

public protocol ImmediateSchedulerType {
    
    func schedule<StateType>(_ state: StateType, action: @escaping (StateType) -> Disposable) -> Disposable
}

// TODO: 需要修改
