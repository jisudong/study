//
//  SchedulerType.swift
//  Study
//
//  Created by syswin on 2017/7/28.
//  Copyright © 2017年 syswin. All rights reserved.
//

import struct Foundation.TimeInterval
import struct Foundation.Date

public typealias  RxTimeInterval = TimeInterval

public typealias RxTime = Date

public protocol SchedulerType: ImmediateSchedulerType {
    
    var now : RxTime { get }
    
    func scheduleRelative<StateType>(_ state: StateType, dueTime: RxTimeInterval, action: @escaping (StateType) -> Disposable) -> Disposable
    
    func schedulePeriodic<StateType>(_ state: StateType, startAfter: RxTimeInterval, period: RxTimeInterval, action: @escaping (StateType) -> StateType) -> Disposable
}

// TODO: 需要修改
