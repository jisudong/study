//
//  InvocableType.swift
//  Study
//
//  Created by syswin on 2017/8/1.
//  Copyright © 2017年 syswin. All rights reserved.
//


protocol InvocableType {
    func invoke()
}

protocol InvocableWithValueType {
    
    associatedtype Value
    
    func invoke(_ value: Value)
}
