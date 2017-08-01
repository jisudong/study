//
//  InvocableScheduledItem.swift
//  Study
//
//  Created by syswin on 2017/8/1.
//  Copyright © 2017年 syswin. All rights reserved.
//

struct InvocableScheduledItem<I: InvocableWithValueType> : InvocableType {
    
    let _invocable: I
    let _state: I.Value
    
    init(invocable: I, state: I.Value) {
        _invocable = invocable
        _state = state
    }
    
    func invoke() {
        _invocable.invoke(_state)
    }
}
