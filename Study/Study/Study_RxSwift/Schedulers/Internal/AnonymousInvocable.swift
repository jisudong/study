//
//  AnonymousInvocable.swift
//  Study
//
//  Created by syswin on 2017/8/1.
//  Copyright © 2017年 syswin. All rights reserved.
//

struct AnonymousInvocable : InvocableType {
    
    private let _action: () -> ()
    
    init(_ action: @escaping () -> ()) {
        _action = action
    }
    
    func invoke() {
        _action()
    }
}
