//: [Previous](@previous)

import Foundation

// 属性

//存储属性，就是存储在对象（实例）中的一个变量或者常量，类似于其他面向对象语言中的成员变量
//class Dog {
//    var name: String = "wangcai"
//}
//class Person {
//    var age: Int = 10
//    var height: Double = 1.5
//    let life = 1
//    var weight = 100
//    lazy var dog: Dog = Dog() // 延迟属性，只能用在变量，不能用在常量
//    func printAgeValue() {
//        print(age)
//    }
//}
//
//var person5 = Person()
//person5.age = 20
//person5.height
//person5.life
//
//person5.age
//MemoryLayout<Dog>.size
//MemoryLayout<Person>.size
//MemoryLayout.size(ofValue: person5)



//计算属性，不是直接存储值，而是提供get和set
//class Square {
//    // 边长
//    var width: Double = 0
//    // 周长
//    var girth: Double {
//        get {
//            return width * 4
//        }
//        set(newGirth) {
//            width = newGirth / 4
//        }
//
//    }
//}
//var s = Square()
//var g = s.girth
//s.girth = 40
//s.width
//s.width = 20
//s.girth

// 只读计算属性
//class Square1 {
//    // 边长
//    var width: Double = 0
//    // 周长
//    var girth: Double {
////        get {
////            return width * 4
////        }
//        return width * 4 //简写
//    }
//}

//类型属性，用class修饰的属性就是类型属性，只能是计算属性不能是存储属性, 直接用类名访问
//class Circle {
//    class var PI: Double {
//        return 3.14
//    }
//
//    // static 修饰的属性，子类不能重写
//    static var a: Int {
//        return 2
//    }
//}
//print("圆周率=%f", Circle.PI)
//Circle.a
//
//class SubCircle: Circle {
//    override class var PI: Double {
//        return 3
//    }
//
//    // 不能重写父类用static修饰的属性
////    override static var a: Int {
////        return 5
////    }
//}


//// 属性监视器
//// 计算属性可以直接在set方法里监听,
//// 存储属性没有set, 用willSet和didSet监听，在属性初始化的时候不会调用
//class Square2 {
//    // 边长
//    var width: Double = 0.0 {
//        willSet { // 在赋值之前调用，会将新的属性值作为参数传入，默认是newValue
//            print("willSet---new=\(newValue), current=\(width)")
//        }
//        didSet { // 在属性赋值之后调用,会将旧的属性值作为参数传入，默认是oldValue
//            print("didSet---old=\(oldValue), current=\(width)")
//        }
//    }
//    // 周长
//    var girth: Double {
//        get {
//            return width * 4
//        }
//        set(newGirth) {
//            width = newGirth / 4
//        }
//    }
//}
//var s2 = Square2()
//s2.width = 30


//class Square3 {
//    // 边长
//    var width: Double = 0.0 {
//        willSet {
//        }
//        didSet {
//            width = 80 //如果在didSet监视器里为属性赋值，这个值会替换之前设置的值。（不会引发死循环）
//        }
//    }
//
//}
//var s3 = Square3()
//s3.width = 40
//print(s3.width)

//// 重写计算属性
//class Car {
//    var speed: Int {
//        get {
//            return 20
//        }
//        set {
//            print("Car ---- set")
//        }
//
//    }
//}
//
//class Truck : Car {
//    override var speed: Int {
//        get {
//            return 30
//        }
//        set {
//            print("Truck ---- set")
//        }
//    }
//}
//var t = Truck()
//t.speed = 30
//print("speed = \(t.speed)")

// 重写存储属性
//class Car1 {
//    var speed: Int = 10
//}
//
//class Truck1: Car1 {
//    override var speed: Int {
//        get {
//            return super.speed
//        }
//        set {
//            if newValue > 100 {
//                super.speed = 100
//            } else {
//                super.speed = newValue
//            }
//        }
//
//    }
//}
//var t1 = Truck1()
//t1.speed = 80
//print("speed = \(t1.speed)")

//class Car2 {
//    var speed: Int = 10 {
//        willSet {
//            print("Car2 - willSet")
//        }
//        didSet {
//            print("Car2 - didSet")
//        }
//    }
//}
//
//class Truck2: Car2 {
//    override var speed: Int {
//        willSet {
//            print("Truck2 - willSet")
//        }
//        didSet {
//            print("Truck2 - didSet")
//        }
//    }
//}
//
//var t2 = Truck2()
//t2.speed = 20