//: [Previous](@previous)

import Foundation



// 错误处理 throws
func canThrowAnError() throws {
    // 这个函数可能抛出错误
    print("canThrowAnError")
}
do {
    try canThrowAnError()
    // 没有错误消息抛出
} catch
{
    // 有一个错误消息抛出
}
func makeASandwich() throws -> Int
{
    return 5;
}


enum VendingMachineError: Error {
    case invalidSelection // 选择无效
    case insufficientFunds(coinsNeeded: Int) // 金额不足
    case outOfStock // 缺货
}
struct Item {
    var price: Int
    var count: Int
}
class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    
    var coinsDeposited = 0
    func dispenseSnack(snack: String) {
        print("Dispense \(snack)")
    }
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

// throwing构造器能像throwing函数一样传递错误
// PurchasedSnack构造器在构造过程中调用了throwing函数,并且通过传递到它的调用者来处理这些错误
struct PurchasedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}

// 错误还是必须要被某个周围的作用域处理的——要么是一个外围的do-catch错误处理语句，要么是一个 throwing 函数的内部
var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
} catch VendingMachineError.invalidSelection {
    print("invalid selection")
} catch VendingMachineError.outOfStock {
    print("out of stock")
} catch VendingMachineError.insufficientFunds(let coinNeeded) {
    print("insufficient funds. please insert an addtional \(coinNeeded) coins")
}
//catch {
//    error
//}

// 可以使用try?通过将错误转换成一个可选值来处理错误。如果在评估try?表达式时一个错误被抛出，那么表达式的值就是nil
func someThrowingFunction() throws -> Int {
    throw VendingMachineError.outOfStock
//    return 1
}
let x = try? someThrowingFunction()

// 有时你知道某个throwing函数实际上在运行时是不会抛出错误的，在这种情况下，你可以在表达式前面写try!来禁用错误传递，这会把调用包装在一个不会有错误抛出的运行时断言中
//let photo = try! loadImage(atPath: "./Resources/John Appleseed.jpg")


// 可以使用defer语句在即将离开当前代码块时执行一系列语句
// 延迟执行的语句不能包含任何控制转移语句，例如break或是return语句，或是抛出一个错误。延迟执行的操作会按照它们被指定时的顺序的相反顺序执行——也就是说，第一条defer语句中的代码会在第二条defer语句中的代码被执行之后才执行，以此类推。
// 即使没有涉及到错误处理，你也可以使用defer语句
func someFunction() throws {
    defer {
        print("第一个defer")
    }
    
    defer {
        print("第二个defer")
    }
    
    print("函数结束了")
}
try someFunction()


