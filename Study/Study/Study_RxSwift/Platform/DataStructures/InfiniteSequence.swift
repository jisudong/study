//
//  InfiniteSequence.swift
//  Study
//
//  Created by syswin on 2017/7/28.
//  Copyright © 2017年 syswin. All rights reserved.
//

struct InfiniteSequence<E> : Sequence {
    typealias Element = E
    typealias Iterator = AnyIterator<E>
    
    private let _repeatedValue: E
    
    init(repeatedValue: E) {
        _repeatedValue = repeatedValue
    }
    
    func makeIterator() -> Iterator {
        let repeatedValue = _repeatedValue
        return AnyIterator {
            return repeatedValue
        }
    }
}
