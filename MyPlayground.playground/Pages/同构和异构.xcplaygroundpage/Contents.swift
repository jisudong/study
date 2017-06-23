//: [Previous](@previous)

import Foundation


// 对于 Swift 的集合数据来说，有同构和异构之分。
// 如果你需要讨论的是一群鸟类或者是一批飞机，这样的数据是同构的
// 集合可能同时包含不用类型的数据源，叫异构数据
protocol CanFly {
    func fly()
}
extension CanFly {
    func fly() {
        print("默认实现")
    }
}
struct Bird: CanFly {
    var name: String
    func fly() {
        print("\(name)在飞翔")
    }
}
struct Airplane: CanFly {
    var company = ""
    func fly() {
        print("飞机在飞行")
    }
}
// 同构数据
var birds: [Bird]
var airplane: [Airplane]

// 异构数据
var flyArray: [CanFly] = [
    Bird(name: "麻雀"),
    Airplane(company: "中国东方航空"),
    Bird(name: "喜鹊")
]

for f in flyArray {
    f.fly()
}
print("")
for f in flyArray {
    if let bird = f as? Bird { // 类型转换
        bird.fly()
    } else if f is Airplane { // 判断类型
        print("找到了飞机")
    }
}
