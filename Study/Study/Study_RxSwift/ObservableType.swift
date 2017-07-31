//
//  ObservableType.swift
//  Study
//
//  Created by syswin on 2017/7/27.
//  Copyright © 2017年 syswin. All rights reserved.
//


public protocol ObservableType : ObserveableConvertibleType {
    
    associatedtype E
    
    func subscribe<O: ObserverType>(_ observer: O) -> Disposable where O.E == E
}

extension ObservableType {
    
    public func asObservable() -> Observable<E> {
        // TODO: 需要修改
         return self as! Observable<Self.E>
    }
}
