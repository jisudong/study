//: [Previous](@previous)

import Foundation

// 下标
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }

    subscript(index1: Int, index2: Int) -> Int {
        return multiplier * index1 + index2
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print(threeTimesTable[6])
print(threeTimesTable[7, 3])
