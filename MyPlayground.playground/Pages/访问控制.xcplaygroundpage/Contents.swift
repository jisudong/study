//: [Previous](@previous)

import Foundation


/*
 * 开放访问和公开访问可以访问同一模块源文件中的任何实体，在模块外也可以通过导入该模块来访问源文件里的所有实体
 * 内部访问可以访问同一模块源文件中的任何实体，但是不能从模块外访问该模块源文件中的实体
 * 文件私有访问限制实体只能被所定义的文件内部访问
 * 私有访问限制实体只能在所定义的作用域内使用
 
 开放访问只作用于类类型和类的成员，它和公开访问的区别如下：
    * 公开访问或者其他更严访问级别的类，只能在它们定义的模块内部被继承。
    * 公开访问或者其他更严访问级别的类成员，只能在它们定义的模块内部的子类中重写。
    * 开放访问的类，可以在它们定义的模块中被继承，也可以在引用它们的模块中被继承。
    * 开放访问的类成员，可以在它们定义的模块中子类中重写，也可以在引用它们的模块中的子类重写。
    * 把一个类标记为开放，显式地表明，你认为其他模块中的代码使用此类作为父类，然后你已经设计好了你的类的代码了
 
 访问级别基本原则:
    * 一个公开访问级别的变量，其类型的访问级别不能是内部，文件私有或是私有类型的
    * 函数的访问级别不能高于它的参数类型和返回类型的访问级别
 */

public class SomePublicClass {                  // 显式公开类
    public var somePublicProperty = 0            // 显式公开类成员
    var someInternalProperty = 0                 // 隐式内部类成员
    fileprivate func someFilePrivateMethod() {}  // 显式文件私有类成员
    private func somePrivateMethod() {}          // 显式私有类成员
}
 
class SomeInternalClass {                       // 隐式内部类
    var someInternalProperty = 0                 // 隐式内部类成员
    fileprivate func someFilePrivateMethod() {}  // 显式文件私有类成员
    private func somePrivateMethod() {}          // 显式私有类成员
}
 
fileprivate class SomeFilePrivateClass {        // 显式文件私有类
    func someFilePrivateMethod() {}              // 隐式文件私有类成员
    private func somePrivateMethod() {}          // 显式私有类成员
}
 
private class SomePrivateClass {                // 显式私有类
    func somePrivateMethod() {}                  // 隐式私有类成员
}

// 元组
private let tuple: (a: SomePrivateClass, b: SomeInternalClass) // 访问级别为private

// 函数
private func someFunction() -> (SomeInternalClass, SomePrivateClass) {
    // 此处是函数实现部分
    return (SomeInternalClass(), SomePrivateClass())
}

// 枚举
// 枚举成员的访问级别和该枚举类型相同，你不能为枚举成员单独指定不同的访问级别
// 枚举定义中的任何原始值或关联值的类型的访问级别至少不能低于枚举类型的访问级别。例如，你不能在一个 internal 访问级别的枚举中定义 private 级别的原始值类型
public enum CompassPoint {
    case North
    case South
    case East
    case West
    // North, South, East, West 都是public访问级别
}

// 嵌套类型
private class A {
    class B { // 类 B 是 private 访问级别
        
    }
}
public class C {
    class D { // 类 D 是 internal 访问级别
        
    }
}

// 子类
// 子类的访问级别不得高于父类的访问级别
public class E {
    private func someMethod() {
        
    }
}
internal class F: E {
    public func someMethod() {
//        super.someMethod()
    }
}

// 常量、变量、属性、下标
// 常量、变量、属性不能拥有比它们的类型更高的访问级别, 下标也不能拥有比索引类型或返回类型更高的访问级别
// 常量、变量、属性、下标的 Getters 和 Setters 的访问级别和它们所属类型的访问级别相同。
// 可以通过 fileprivate(set)，private(set) 或 internal(set) 为它们的写入权限指定更低的访问级别
struct TrackedString {
//    let a = A() // 报错，因为这里的 a 的访问级别是 internal ，类 A 的访问级别是 private
    private(set) var stringOfEdits = 0 //getter: internal, setter: private
    var value: String = "" {
        didSet {
            stringOfEdits += 1
        }
    }
}

public struct TrackedString1 {
    public private(set) var stringOfEdits = 0 // getter: public, setter: private
    var value: String = "" {
        didSet {
            stringOfEdits += 1
        }
    }
}


// 构造器
// 自定义构造器的访问级别可以低于或等于其所属类型的访问级别。
// 必要构造器，它的访问级别必须和所属类型的访问级别相同
private class G {
    var name = ""
    // 默认构造器 init() 的访问级别是 private
}
public class H {
    var age = 0
    // 默认构造器 init() 的访问级别是 internal
}
public class J {
    var name = ""
    public init() { // 改变默认构造器的访问级别为 public
        
    }
}

// 如果结构体中任意存储型属性的访问级别为 private，那么该结构体默认的成员逐一构造器的访问级别就是 private。否则，这种构造器的访问级别依然是 internal
struct K {
    var name: String
    private var age: Int
    // init(name:age:)的访问级别是 private
}
struct L {
    var name: String
    var age: Int
    public init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}


// 协议
// 协议中的每一个要求都具有和该协议相同的访问级别
public protocol M {
    func method() // public
    var name: String { get } // public
}

// 如果定义了一个继承自其他协议的新协议，那么新协议拥有的访问级别最高也只能和被继承协议的访问级别相同
// 一个类型可以采纳比自身访问级别低的协议, 但是只能在该协议所在的模块中作为符合该协议的类型使用
// 采纳了协议的类型的访问级别取它本身和所采纳协议两者间最低的访问级别
// 如果你采纳了协议，那么实现了协议的所有要求后，你必须确保这些实现的访问级别不能低于协议的访问级别


// 扩展
// 扩展成员具有和原始类型成员一致的访问级别
public class N {
    
}
extension N {
    var age: Int { // 访问级别是 internal
        return 1
    }
}
private extension N {
    func someMethod() { // 访问级别是 private
        
    }
    
    private func anotherMethod() { // 覆盖了 private， 访问级别是 internal
        
    }
}


// 泛型
// 泛型类型或泛型函数的访问级别取决于泛型类型或泛型函数本身的访问级别，还需结合类型参数的类型约束的访问级别，根据这些访问级别中的最低访问级别来确定

// 类型别名
// 你定义的任何类型别名都会被当作不同的类型，以便于进行访问控制。类型别名的访问级别不可高于其表示的类型的访问级别。例如，private 级别的类型别名可以作为 private，file-private，internal，public或者open类型的别名，但是 public 级别的类型别名只能作为 public 类型的别名，不能作为 internal，file-private，或 private 类型的别名
// 这条规则也适用于为满足协议一致性而将类型别名用于关联类型的情况


