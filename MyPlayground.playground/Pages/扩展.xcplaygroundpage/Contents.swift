//: [Previous](@previous)

import Foundation


// 扩展
/*
 * 添加计算型属性
 扩展可以添加新的计算型属性，但是不可以添加存储型属性，也不可以为已有属性添加属性观察器
 
 * 添加构造器
 扩展能为类添加新的便利构造器，但是它们不能为类添加新的指定构造器或析构器。指定构造器和析构器必须总是由原始的类实现来提供
 如果你使用扩展为一个值类型添加构造器，同时该值类型的原始实现中未定义任何定制的构造器且所有存储属性提供了默认值，那么我们就可以在扩展中的构造器里调用默认构造器和逐一成员构造器
 如果你使用扩展提供了一个新的构造器，你依旧有责任确保构造过程能够让实例完全初始化
 
 * 添加方法
 通过扩展添加的实例方法也可以修改该实例本身。结构体和枚举类型中修改 self 或其属性的方法必须将该实例方法标注为 mutating，正如来自原始实现的可变方法一样
 
 * 添加下标
 
 * 添加嵌套类型
 
 */
//struct Point {
//    var x = 0.0, y = 0.0
//}
//struct Size {
//    var width = 0.0, height = 0.0
//}
//struct Rect {
//    var origin = Point()
//    var size = Size()
//}
//
//extension Rect {
//    init(center: Point, size: Size) {
//        let originX = center.x - (size.width / 2)
//        let originY = center.y - (size.height / 2)
//        self.init(origin: Point(x: originX, y: originY), size: size)//调用逐一成员构造器
//    }
//}
