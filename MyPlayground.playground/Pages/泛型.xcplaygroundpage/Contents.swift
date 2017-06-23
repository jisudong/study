//: [Previous](@previous)

import Foundation



//// 泛型
//// 泛型函数
//func swapTwoValues<T>(_ a: inout T, _ b: inout T)
//{
//    let temporaryA = a
//    a = b
//    b = temporaryA
//}

//// 泛型类型
//struct Stack<T>
//{
//    var items = [T]()
//    mutating func push(item: T)
//    {
//        items.append(item)
//    }
//
//    mutating func pop() -> T
//    {
//        return items.removeLast()
//    }
//}
//var stackOfStrings = Stack<String>()
//stackOfStrings.push(item: "uno")
//stackOfStrings.push(item: "dos")
//stackOfStrings.push(item: "tres")
//stackOfStrings.push(item: "cuatro")
//let fromTheTop = stackOfStrings.pop()

//// 扩展一个泛型类型
//extension Stack
//{
//    var topItem: T? {
//        return items.isEmpty ? nil : items[items.count - 1]
//    }
//}
//if let topItem = stackOfStrings.topItem
//{
//    print("The top item on the stack is \(topItem)")
//}

// 类型约束
// 类型约束语法
//func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U)
//{
//    // 函数主体
//}

/*
 Swift 标准库中定义了一个Equatable协议，该协议要求任何遵循的类型实现等式符（==）和不等符（!=）对任何两个该类型进行比较。所有的 Swift 标准类型自动支持Equatable协议。
 */
//func findIndex<T: Equatable>(_ array: [T], _ valueToFind: T) -> Int?
//{
//    for (index, value) in array.enumerated()
//    {
//        if value == valueToFind
//        {
//            return index
//        }
//    }
//    return nil
//}
//let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
//if let foundIndex = findIndex(strings, "llama")
//{
//    print("The index of llama is \(foundIndex)")
//}

// 关联类型
protocol Container
{
    associatedtype ItemType
    mutating func append(item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

struct Int_2_Stack: Container
{
    var items = [Int]()
    mutating func push(item: Int)
    {
        items.append(item)
    }
    
    mutating func pop() -> Int
    {
        return items.removeLast()
    }
    
    typealias ItemType = Int // 可以不写，swift 能自动推断类型
    mutating func append(item: Int)
    {
        self.push(item: item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Int
    {
        return items[i]
    }
}

struct Stack_2<T>: Container
{
    var items = [T]()
    mutating func push(item: T)
    {
        items.append(item)
    }
    
    mutating func pop() -> T
    {
        return items.removeLast()
    }
    
    //    typealias ItemType = T
    mutating func append(item: T)
    {
        self.push(item: item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> T
    {
        return items[i]
    }
}

// 对关联类型定义约束
func allItemsMatch<C1: Container, C2: Container>(someContainer: C1, anotherContainer: C2) -> Bool where C1.ItemType == C2.ItemType, C1.ItemType: Equatable
{
    if someContainer.count != anotherContainer.count
    {
        return false
    }
    
    for i in 0..<someContainer.count
    {
        if someContainer[i] != anotherContainer[i]
        {
            return false
        }
    }
    
    return true
}
extension Array: Container {
    mutating func append(item: Element) {
        
    }
}
var stack = Stack_2<String>()
stack.push(item: "undo")
stack.push(item: "abc")
stack.push(item: "cde")
var array = ["undo", "abc", "cde"]
allItemsMatch(someContainer: stack, anotherContainer: array)



