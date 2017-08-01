//
//  DisposeBase.swift
//  Study
//
//  Created by syswin on 2017/8/1.
//  Copyright © 2017年 syswin. All rights reserved.
//

public class DisposeBase {
    
    init() {
    #if TRACE_RESOURCES
        let _ = Resources.incrementTotal()
    #endif
    }
    
    deinit {
    #if TRACE_RESOURCES
        let _ = Resources.decrementTotal()
    #endif
    }
}
