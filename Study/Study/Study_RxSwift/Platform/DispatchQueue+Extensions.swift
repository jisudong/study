//
//  DispatchQueue+Extensions.swift
//  Study
//
//  Created by syswin on 2017/8/1.
//  Copyright © 2017年 syswin. All rights reserved.
//

import Dispatch

extension DispatchQueue {
    private static var token: DispatchSpecificKey<()> = {
        let key = DispatchSpecificKey<()>()
        DispatchQueue.main.setSpecific(key: key, value: ())
        return key
    }()
    
    static var isMain: Bool {
        return DispatchQueue.getSpecific(key: token) != nil
    }
}
