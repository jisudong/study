//: [Previous](@previous)

import Foundation


//// 构造 和 析构

// 构造器代理
// 构造器可以通过调用其它构造器来完成实例的部分构造过程。这一过程称为构造器代理，它能减少多个构造器间的代码重复
// 值类型如果想保留默认构造器和逐一成员构造器，把自定义构造器写在扩展里(extension)
//struct Point {
//    var x: Double
//    var y: Double
//
//}
//extension Point {
//    init(y: Double) {
//        self.x = 0
//        self.y = y
//    }
//}
//let point1 = Point(y: 5)
//let point2 = Point(x: 2, y: 5) // 逐一成员构造器

//struct Size {
//    var width = 0.0, height = 0.0
//}
//struct Point {
//    var x = 0.0, y = 0.0
//}
//
//struct Rect {
//    var origin = Point()
//    var size = Size()
//
//    init() {}
//
//    init(origin: Point, size: Size) {
//        self.origin = origin
//        self.size = size
//    }
//
//    init(center: Point, size: Size) {
//        let originX = center.x - (size.width / 2)
//        let originY = center.y - (size.height / 2)
//        self.init(origin: Point(x: originX, y: originY), size: size) // 调用其他构造器
//    }
//}


//// 类和结构体的所有属性都有默认值，同时没有自定义构造器，swift会有一个指定构造方法 init() {/*...*/}
//// 如果一个类定义了有参的指定构造方法，系统就不会自动生成无参的指定构造方法
//// 指定构造方法必须调用其直接父类的指定构造方法（除非没有父类）
//// 便利构造方法必须调用同一类中定义的其他构造方法
//// 便利构造方法必须最终以调用一个指定构造方法结束
//// 只有便利构造方法才能调用当前类的其他构造方法
//// 只有指定构造方法才能直接调用父类的构造方法


// 类里面的所有存储型属性——包括所有继承自父类的属性——都必须在构造过程中设置初始值

// 两段式构造
// Swift 中类的构造过程包含两个阶段。第一个阶段，每个存储型属性被引入它们的类指定一个初始值。当每个存储型属性的初始值被确定后，第二阶段开始，它给每个类一次机会，在新实例准备使用之前进一步定制它们的存储型属性
// 两段式构造过程的使用让构造过程更安全，同时在整个类层级结构中给予了每个类完全的灵活性。两段式构造过程可以防止属性值在初始化之前被访问，也可以防止属性被另外一个构造器意外地赋予不同的值。

/*
 
 Swift 编译器将执行 4 种有效的安全检查，以确保两段式构造过程能不出错地完成：
 
 安全检查 1
 指定构造器必须保证它所在类引入的所有属性都必须先初始化完成，之后才能将其它构造任务向上代理给父类中的构造器。
 
 如上所述，一个对象的内存只有在其所有存储型属性确定之后才能完全初始化。为了满足这一规则，指定构造器必须保证它所在类引入的属性在它往上代理之前先完成初始化。
 
 安全检查 2
 指定构造器必须先向上代理调用父类构造器，然后再为继承的属性设置新值。如果没这么做，指定构造器赋予的新值将被父类中的构造器所覆盖。
 
 安全检查 3
 便利构造器必须先代理调用同一类中的其它构造器，然后再为任意属性赋新值。如果没这么做，便利构造器赋予的新值将被同一类中其它指定构造器所覆盖。
 
 安全检查 4
 构造器在第一阶段构造完成之前，不能调用任何实例方法，不能读取任何实例属性的值，不能引用self作为一个值。
 
 类实例在第一阶段结束以前并不是完全有效的。只有第一阶段完成后，该实例才会成为有效实例，才能访问属性和调用方法。
 
 
 
 以下是两段式构造过程中基于上述安全检查的构造流程展示：
 
 阶段 1
 * 某个指定构造器或便利构造器被调用。
 * 完成新实例内存的分配，但此时内存还没有被初始化。
 * 指定构造器确保其所在类引入的所有存储型属性都已赋初值。存储型属性所属的内存完成初始化。
 * 指定构造器将调用父类的构造器，完成父类属性的初始化。
 * 这个调用父类构造器的过程沿着构造器链一直往上执行，直到到达构造器链的最顶部。
 * 当到达了构造器链最顶部，且已确保所有实例包含的存储型属性都已经赋值，这个实例的内存被认为已经完全初始化。此时阶段 1 完成。
 
 阶段 2
 * 从顶部构造器链一直往下，每个构造器链中类的指定构造器都有机会进一步定制实例。构造器此时可以访问self、修改它的属性并调用实例方法等等。
 * 最终，任意构造器链中的便利构造器可以有机会定制实例和使用self
 
 */


//// 指定构造方法
//class Dog1 {
//    var age: Int
//    init() {
//        self.age = 1 // 存储属性可以在 init 方法中赋值
//    }
//}
//
//class Dog2 {
//    var name: String = "no name"
//    var age: Int = 1
//
//    init() {
//
//    }
//
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//}
//var dog2 = Dog2()
//print("name = \(dog2.name), age = \(dog2.age)")
//var dog3 = Dog2(name: "jack", age: 2)
//print("name = \(dog3.name), age = \(dog3.age)")

//// 便利构造方法
//class Dog3 {
//    var speed: Double
//    var name: String
//    var age: Int
//    init(name: String, age: Int, speed: Double) {
//        self.name = name
//        self.age = age
//        self.speed = speed
//    }
//
//    convenience init(name: String) {
//        self.init(name: name, age: 1, speed: 0.0)
//    }
//
//    convenience init(age: Int) {
//        self.init(name: "", age: age, speed: 0.0)
//    }
//
//    convenience init(speed: Double) {
//        self.init(name: "", age: 1, speed: speed)
//    }
//}

//// 如果父类中只有一个指定构造方法而且是无参的，子类的指定构造方法默认会自动调用父类的无参的指定构造方法
//class Animal2 {
//    init() {
//        print("Animal --- init")
//    }
//}
//
//class Dog4 : Animal2 {
//    var name: String
//    init(name: String) {
//        self.name = name
//    }
//
//    // 即使重写为 convenience 构造器，也要加 override
//    convenience override init() {
//        self.init(name: "")
//    }
//}
//var d4 = Dog4(name: "rose")

// 如果父类中存在有参的指定构造方法，子类的指定构造方法不会自动调用父类无参的指定构造方法
// 存储属性，只能由父类先初始化，再由子类初始化
// 常量属性只能在定义它的类的构造过程中初始化，不能在子类中初始化
//class Animal3 {
//    var age: Int
//    let life: Int
//    init() {
//        self.age = 1
//        self.life = 1
//        print("Animal --- init")
//    }
////    init(name: String) {
////        print("Animal --- init-\(name)")
////    }
//}
//
//class Dog5 : Animal3 {
//    var legs: Int
//    override init() {
//        self.legs = 4
//        super.init()
//        self.age = 10
//       print("Dog5 --- init")
//    }
//}

// 构造器的自动继承
/*
 假设你为子类中引入的所有新属性都提供了默认值，以下 2 个规则适用：
 
 规则 1
 如果子类没有定义任何指定构造器，它将自动继承所有父类的指定构造器。
 
 规则 2
 如果子类提供了所有父类指定构造器的实现——无论是通过规则 1 继承过来的，还是提供了自定义实现——它将自动继承所有父类的便利构造器。
 
 即使你在子类中添加了更多的便利构造器，这两条规则仍然适用。
 
 注意
 对于规则 2，子类可以将父类的指定构造器实现为便利构造器。
 */
//class Food {
//    var name: String
//    init(name: String) {
//        self.name = name
//    }
//
//    convenience init() {
//        self.init(name: "[Unamed]")
//    }
//}
//
//class RecipeIngredient: Food {
//    var quantity: Int
//    init(name: String, quantity: Int) {
//        self.quantity = quantity
//        super.init(name: name)
//    }
//
//    // 实现了父类所有的指定构造器，所以继承了遍历构造器 init()
//    override convenience init(name: String) {
//        self.init(name: name, quantity: 1)
//    }
//}
//let recipe1 = RecipeIngredient() // 继承来的构造器
//let recipe2 = RecipeIngredient(name: "tomato")
//let recipe3 = RecipeIngredient(name: "tomato", quantity: 3)
//
//class ShoppingListItem: RecipeIngredient {
//    var purchased = false
//    var description: String {
//        var output = "\(quantity) x \(name)"
//        output += purchased ? " ✔" : " ✘"
//        return output
//    }
//    // 继承了init() init(name: String) init(name: String, quantity: Int)
//}
//var breakfastList = [
//    ShoppingListItem(),
//    ShoppingListItem(name: "Bacon"),
//    ShoppingListItem(name: "Eggs", quantity: 6)
//]
//breakfastList[0].name = "Orange juice"
//breakfastList[0].purchased = true
//for item in breakfastList {
//    print(item.description)
//}

//// 可失败构造器 init?  构造的是可选型
//struct Animal {
//    var species: String
//    init?(species: String) {
//        if species.isEmpty {
//            return nil // 只是用 return nil 表示构造失败，不是真的有返回值
//        }
//        self.species = species
//    }
//}
//
//enum TemperatureUnit {
//    case Kelvin, Celsius, Fahrenheit
//    init?(symbol: Character) {
//        switch symbol {
//        case "K":
//            self = .Kelvin
//        case "C":
//            self = .Celsius
//        case "F":
//            self = .Fahrenheit
//        default:
//            return nil
//        }
//    }
//}
//
//// 枚举带原始值，会自动生成一个可失败构造器 init?(rawValue:)
//// 所以上面可以重写为下面的形式
//enum TemperatureUnit1: Character {
//    case Kelvin = "K", Celsius = "C", Fahrenheit = "F"
//}

/*
 类，结构体，枚举的可失败构造器可以横向代理到类型中的其他可失败构造器。类似的，子类的可失败构造器也能向上代理到父类的可失败构造器。
 
 无论是向上代理还是横向代理，如果你代理到的其他可失败构造器触发构造失败，整个构造过程将立即终止，接下来的任何构造代码不会再被执行。
 
 注意
 可失败构造器也可以代理到其它的非可失败构造器。通过这种方式，你可以增加一个可能的失败状态到现有的构造过程中。
 */
//class Product {
//    var name: String
//    init?(name: String) {
//        if name.isEmpty {
//            return nil
//        }
//        self.name = name
//    }
//}
//
//class CartItem: Product {
//    var quantity: Int
//    init?(name: String, quantity: Int) {
//        if quantity < 1 {
//            return nil
//        }
//        self.quantity = quantity
//        super.init(name: name)
//    }
//}


// 析构方法
//class Life {
//    deinit {
//        print("Life -- deinit")
//    }
//}
//
//class Animal6: Life {
//    deinit {
//        print("Animal6 -- deinit")
//    }
//}
//
//class Dog6: Animal6 {
//    deinit {
//        print("Dog6 -- deinit")
//    }
//}
//
//func test() {
//    _ = Dog6()
//
//}
//test()


