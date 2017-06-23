//: [Previous](@previous)

import Foundation

// 可选类型

// 当一个值可能存在，可能不存在的时候用可选类型
// 格式：类型名？
class Person6 {
    var phone: String?
}
// 问号？表明phone的值是可选的，可能是一个String，也可能不存在（nil）
// phone 默认值就是 nil，因此上面的语句相当于 var phone: String? = nil



// 强制解包
// 使用感叹号！将可选类型的（包装）的值取出来
// 在可选类型的后面加一个感叹号！，就可以把可选类型（包装）的值取出来，赋值给具体类型
// 如果可选类型（包装）的值不存在，仍然强制解包，运行时会报错
var number: Int? = 10
var number1: Int = number!
print(number ?? 0)
print(number1)

// 判断
if (number != nil) {

} else {

}

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber
{
    print("\(firstNumber) < \(secondNumber)")
}


// 隐式解包
// 格式：将问号？换成感叹号！
// 能够自动解包：自动把可选类型（包装）的值取出来赋给具体类型
var number3: Int! = 20
var number4: Int = number3 //自动解包，不用再使用!


// map 和 flatMap
class Student {
    var name: String?
    var age: Int?
}
let xm = Student()
//xm.age = 3
xm.name = "小明"
func isAdult(stu: Student) -> Bool? {
    return stu.age.map { // 当可选项不为空时，闭包被执行
        print("map 被执行")
        // map 方法中的参数默认已经解包了，所以 $0 是 Int 类型
        return $0 >= 18 ? true : false
    }
}
isAdult(stu: xm)

func example(code: String) -> Student? {
    if code == "xm" {
        let xiaoming = Student()
        xiaoming.name = "小明"
        xiaoming.age = 12
        return xiaoming
    } else if code == "xg" {
        let xiaogang = Student()
        xiaogang.name = "小刚"
        xiaogang.age = 15
        return xiaogang
    }
    
    return nil
    
}
// result 是双重可选型 Bool??
let result = example(code: "xm").map {
    isAdult(stu: $0)
}
let resultA = result!

// result1 是单重可选型 Bool?
let result1 = example(code: "xm").flatMap {
//    print("flatMap 被执行")
    isAdult(stu: $0)
}




