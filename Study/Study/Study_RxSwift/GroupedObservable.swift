//
//  GroupedObservable.swift
//  Study
//
//  Created by syswin on 2017/7/28.
//  Copyright © 2017年 syswin. All rights reserved.
//

public struct GroupedObservable<Key, Element> : ObservableType {
    
    public typealias E = Element
    
    public let key: Key
    
    private let source: Observable<Element>
    
    public init(key: Key, source: Observable<Element>) {
        self.key = key
        self.source = source
    }
    
    public func subscribe<O>(_ observer: O) -> Disposable where O : ObserverType, O.E == E {
        return self.source.subscribe(observer)
    }
    
    public func asObservable() -> Observable<Element> {
        return source
    }
}
