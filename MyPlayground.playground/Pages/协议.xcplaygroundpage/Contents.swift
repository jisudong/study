//: [Previous](@previous)

import Foundation


// 协议（协议是一种类型）
/*
 * 在值类型（即结构体和枚举）的实例方法中，将 mutating 关键字作为方法的前缀
 * 实现协议中的 mutating 方法时，若是类类型，则不用写 mutating 关键字。而对于结构体和枚举，则必须写 mutating 关键字
 * 你可以在遵循协议的类中实现构造器,必须为构造器实现标上 required 修饰符(如果类已经被标记为 final，那么不需要在协议构造器的实现中使用 required 修饰符)
 * 如果一个子类重写了父类的指定构造器，并且该构造器满足了某个协议的要求，那么该构造器的实现需要同时标注 required 和 override 修饰符
 * 遵循协议的类型可以通过可失败构造器（init?）或非可失败构造器（init）来满足协议中定义的可失败构造器要求。协议中定义的非可失败构造器要求可以通过非可失败构造器（init）或隐式解包可失败构造器（init!）来满足
 * 一个属性的类型是一个协议类型（SomeProtocol），遵循了这个协议的类型的实例都可以赋值给这个属性
 */

//// mutating
//protocol Togglable {
//    mutating func toggle() // mutating 修饰的方法
//}
//enum OnOffSwitch: Togglable {
//    case On, Off
//    mutating func toggle() {
//        switch self {
//        case .On:
//            self = .Off
//        case .Off:
//            self = .On
//
//        }
//    }
//}

//// required, override
//protocol SomeProtocol {
//    init(someParameter: Int)
//    init()
//}
//class SomeClass: SomeProtocol {
//    required init(someParameter: Int) {
//
//    }
//    required init() {
//
//    }
//}
//
//class SomeSuperClass {
//    init() {
//
//    }
//}
//class SomeSubClass: SomeSuperClass, SomeProtocol {
//    required override init() { // required, override
//
//    }
//
//    required init(someParameter: Int) { // required
//
//    }
//}

//// 协议继承
//protocol TextRepresentable {
//    var textualDescription: String { get }
//}
//protocol PrettyTextRepresentable: TextRepresentable {
//    var prettyTextualDescription: String { get }
//}
//class AClass: PrettyTextRepresentable {
//    var textualDescription: String {
//        return "TextRepresentable-description"
//    }
//    var prettyTextualDescription: String {
//        return textualDescription + "prettyTextualDescription-description"
//    }
//}
//
//// 类类型专属协议
//protocol SomeClassProtocol: class, TextRepresentable {
//    // 这个协议只能被类类型遵循
//}

//// 协议的合成
//protocol Named {
//    var name: String { get }
//}
//protocol Aged {
//    var age: Int { get }
//}
//struct Person: Named, Aged {
//    var name: String
//    var age: Int
//}
//// 协议合成并不会生成新的、永久的协议类型，而是将多个协议中的要求合成到一个只在局部作用域有效的临时协议中
//typealias named_aged = Named & Aged // & 用来合成协议
//func wishHappyBirthday(to celebrator: named_aged) {
//    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)")
//}
//let birthdayPerson = Person(name: "jenny", age: 21)
//wishHappyBirthday(to: birthdayPerson)

// 检查协议一致性
/*
 is 用来检查实例是否符合某个协议，若符合则返回 true，否则返回 false。
 as? 返回一个可选值，当实例符合某个协议时，返回类型为协议类型的可选值，否则返回 nil。
 as! 将实例强制向下转换到某个协议类型，如果强转失败，会引发运行时错误
 */
//protocol HasArea {
//    var area: Double { get }
//}
//class Circle: HasArea {
//    let pi = 3.1415926
//    var radius: Double
//    var area: Double { // 实现成计算属性
//        return pi * radius * radius
//    }
//    init(radius: Double) {
//        self.radius = radius
//    }
//}
//class Country: HasArea {
//    var area: Double // 实现成存储属性
//    init(area: Double) {
//        self.area = area
//    }
//}
//class Animal {
//    var legs: Int
//    init(legs: Int) {
//        self.legs = legs
//    }
//}
//let objects: [AnyObject] = [
//    Circle(radius: 5),
//    Country(area: 243_610),
//    Animal(legs: 4)
//]
//for object in objects {
//    if let objectWithArea = object as? HasArea {
//        print("Area is \(objectWithArea.area)")
//    } else {
//        print("Something that doesn't have an area")
//    }
//}

//// 可选的协议要求
//@objc protocol CounterDataSource {
//    @objc optional func increment(forCount count: Int) -> Int
//    @objc optional var fixedIncrement: Int { get }
//}
//class Counter {
//    var count: Int = 0
//    var dataSource: CounterDataSource?
//    func increment() {
//        if let amount = dataSource?.increment?(forCount: count) {
//            count += amount
//        } else if let amount = dataSource?.fixedIncrement {
//            count += amount
//        }
//    }
//}
//class ThreeSource: NSObject, CounterDataSource {
//    let fixedIncrement: Int = 3
//}
//
//var counter = Counter()
//counter.dataSource = ThreeSource()
//for _ in 1...4 {
//    counter.increment()
//    print(counter.count)
//}
//
//@objc class TowardsZeroSource: NSObject, CounterDataSource {
//    func increment(forCount count: Int) -> Int {
//        if count == 0 {
//            return 0
//        } else if count < 0 {
//            return 1
//        } else {
//            return -1
//        }
//    }
//}

//counter.count = -4
//counter.dataSource = TowardsZeroSource()
//for _ in 1...5 {
//    counter.increment()
//    print(counter.count)
//}

// 协议扩展
//protocol Coder {
//    var haveFun: Bool { get }
//    var ownMoney: Bool { get }
//}
//protocol Swifter {
//    var codingLevel: Int { get }
//}
//struct CoderFromA: Coder {
//    var name: String
//    var haveFun: Bool
//    var ownMoney: Bool
//}
//struct CoderFromB: Coder, Swifter {
//    var name: String
//    var codingLevel = 3
//}
//struct CoderFromC: Coder, Swifter {
//    var name: String
//    var codingLevel = 5
//}
//extension Coder where Self: Swifter {
//    // 协议扩展中不能定义存储属性
////    var haveFun: Bool = true // 会报错
//    var haveFun: Bool {
//        return true
//    }
//    var ownMoney: Bool {
//        return true
//    }
//}

//// 协议的静态特性
//protocol SharedString {
////    func methodForOverride()
////    func methodWithoutOverride()
//}
//extension SharedString {
//    func methodForOverride() {
//        print("~\\(^o^)/~")
//    }
//    func methodWithoutOverride() {
//        print("--------")
//        methodForOverride()
//        print("--------")
//    }
//}
//
//extension String: SharedString {
//    func methodForOverride() {
//        print(self)
//    }
//}
//"hello".methodForOverride()
//"hello".methodWithoutOverride()
// 修改上下文
//let hello: SharedString = "hello"
//hello.methodForOverride()
//hello.methodWithoutOverride()

//// 协议继承中的静态特性
//protocol SearchIntArrayMax {
//
//}
//extension SearchIntArrayMax where Self: Collection, Self.Iterator.Element == Int {
//    func showMax() -> String {
//        if let max = self.max() {
//            return "\(max)"
//        }
//        return "无最大值"
//    }
//}
//extension Array: SearchIntArrayMax {
//    // 这里实现了协议，覆盖了协议的默认实现
//    func showMax() -> Iterator.Element? {
//        if self.count > 0 {
//            return self.last
//        }
//        return nil
//    }
//}
//protocol CanCompareMax: SearchIntArrayMax {
//
//}
//extension CanCompareMax where Self: Collection, Self.Iterator.Element == Int {
//    func compareMax(other: Self) -> String {
//        // 虽然上面扩展实现了协议，但是由于静态特性，showMax()还是调用默认实现
//        switch (self.showMax(), other.showMax()) {
//        case ("无最大值", _) :
//            fallthrough
//        case (_, "无最大值") :
//            return "无最大值"
//        case let (a, b) where a == b :
//            return a
//        default:
//            return "不相等"
//        }
//    }
//}
//extension Array: CanCompareMax {
//
//}
//[1, 2, 3].compareMax(other: [1, 1, 1])
//[1, 2, 3].compareMax(other: [1, 3, 1])
//[1, 2, 3].compareMax(other: [])



