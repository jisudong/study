//: [Previous](@previous)

import Foundation

//// 继承
class Animal {
    var age: Int = 0
    let legs: Int = 4
    final var live = 1
    func run() {
        print("Animal --- run")
    }

    static func eat() {
        print("Animal --- eat")
    }

    class func drink() {
        print("Animal --- drink")
    }

}

class Cat : Animal {
    override var age: Int {
        get {
            return 1
        }
        set {

        }
    }

    override func run() { // 重写方法
        super.run()
        print("Cat --- run")
    }

    override class func drink() {
        print("Cat --- drink")
    }

}
var cat = Cat()
cat.run()
Animal.eat()



//// final关键字 : 被 final 修饰的属性和方法不能被子类重写， 被 final 修饰的类不能被继承
////final class A {
////
////}
////class B : A {
////
////}
