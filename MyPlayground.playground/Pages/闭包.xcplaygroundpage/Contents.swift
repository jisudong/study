//: [Previous](@previous)

import Foundation


//// 闭包
// 逃逸闭包(escaping closure)
var completionHanders: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHander: @escaping () -> Void)
{
    completionHanders.append(completionHander)
}

func someFunctionWithNonescapingClosure(closure: () -> Void)
{
    closure()
}

class someClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { // 逃逸闭包需要显式引用 self
            self.x = 100
        }
        someFunctionWithNonescapingClosure { // 非逃逸闭包可以隐式引用 self
            x = 200
        }
    }
}
let instance = someClass()
instance.doSomething()
print(instance.x)

completionHanders.first?()
print(instance.x)

// 自动闭包(autoclosure)
var customersInline = ["A", "B", "C", "D", "E"]
func serve(customer customerProvidor: () -> String) {
    print("Now serving \(customerProvidor())!")
}
serve(customer: {customersInline.remove(at: 0)})

func serve(customer customerProvidor: @autoclosure () -> String) {
    print("Now serving \(customerProvidor())!")
}
serve(customer: customersInline.remove(at: 0)) // 跟上面相比，不用显示写出闭包，但是代码难以理解
