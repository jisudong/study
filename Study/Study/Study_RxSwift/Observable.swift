//
//  Observable.swift
//  Study
//
//  Created by syswin on 2017/7/27.
//  Copyright © 2017年 syswin. All rights reserved.
//


public class Observable<Element> : ObservableType {
    
    public typealias E = Element
    
    init() {
#if TRACE_RESOURCES
    
#endif
    }
    
    public func subscribe<O>(_ observer: O) -> Disposable where O : ObserverType, O.E == E {
        // TODO: 需要修改
        return self as! Disposable
    }
    
    public func asObservable() -> Observable<E> {
        return self
    }
}
