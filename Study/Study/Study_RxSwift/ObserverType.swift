//
//  ObserverType.swift
//  Study
//
//  Created by syswin on 2017/7/27.
//  Copyright © 2017年 syswin. All rights reserved.
//

public protocol ObserverType {
    
    associatedtype E
    
    func on(_ event: Event<E>)
}

extension ObserverType {
    
    public final func onNext(_ element: E) {
        on(.next(element))
    }
    
    public final func onCompleted() {
        on(.completed)
    }
    
    public final func onError(_ error: Swift.Error) {
        on(.error(error))
    }
}
