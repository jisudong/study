//
//  ConnectableObservableType.swift
//  Study
//
//  Created by syswin on 2017/7/28.
//  Copyright © 2017年 syswin. All rights reserved.
//


public protocol ConnectableObservableType : ObservableType {
    
    func connect() -> Disposable
}
