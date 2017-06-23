//: [Previous](@previous)

import UIKit


//// Copy-on-Write
//struct BezierPath {
//    private var _path = UIBezierPath()
//    var pathForReading: UIBezierPath {
//        return _path
//    }
//    var pathForWriting: UIBezierPath {
//        mutating get {
//            // isKnownUniquelyReferenced(&<#T##object: T##T#>)是swift方法，只能传swift引用类型对象
//            if !isKnownUniquelyReferenced(&_path) {
//                _path = _path.copy() as! UIBezierPath
//                print("拷贝")
//                return _path
//            }
//            
//            print("未拷贝")
//            return _path
//        }
//    }
//}
//var bezierA = BezierPath()
//bezierA.pathForWriting
//var bezierB = bezierA
//bezierB.pathForWriting.lineWidth = 10
//bezierA.pathForReading.lineWidth
//bezierB.pathForReading.lineWidth


class Box<T> {
    var rawValue: T
    init(rawValue: T) {
        self.rawValue = rawValue
    }
}
struct BezierPath {
    private var _boxOfPath = Box(rawValue: UIBezierPath())
    var boxForReading: Box<UIBezierPath> {
        return _boxOfPath
    }
    var boxForWriting: Box<UIBezierPath> {
        mutating get {
            if !isKnownUniquelyReferenced(&_boxOfPath) {
                _boxOfPath = Box(rawValue: _boxOfPath.rawValue.copy() as! UIBezierPath)
                print("拷贝")
                return _boxOfPath
            }
            print("未拷贝")
            return _boxOfPath
        }
    }
}
MemoryLayout<BezierPath>.size
var bezierA = BezierPath()
MemoryLayout.size(ofValue: bezierA)
bezierA.boxForWriting.rawValue.lineWidth = 3
var bezierB = bezierA
bezierB.boxForWriting.rawValue.lineWidth = 5
bezierA.boxForWriting.rawValue.lineWidth = 10
bezierA.boxForReading.rawValue.lineWidth
bezierB.boxForReading.rawValue.lineWidth


// 对象中定义的方法本身以及方法的参数都不会保存在该对象的实例中，
// 当闭包作为方法的参数的时候，即便闭包中会持有self，也不会引起循环引用

// 动态派发：在运行时程序会根据被调用的方法的名字去内存中的方法表中查表，找到方法的实现并执行
// 静态派发：在运行时调用方法不需要查表，直接跳到方法的代码中执行
// 内联：指在编译器把每一处方法的调用替换成直接执行方法的内部代码
// 静态派发为内联提供了支持，支持内联的方法要求方法本身必须是静态派发的
// Swift中值类型的方法是默认执行内联的




