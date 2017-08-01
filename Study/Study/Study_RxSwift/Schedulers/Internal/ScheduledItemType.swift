//
//  ScheduledItemType.swift
//  Study
//
//  Created by syswin on 2017/8/1.
//  Copyright © 2017年 syswin. All rights reserved.
//

protocol ScheduledItemType : Cancelable, InvocableType {
    
    func invoke()
}
