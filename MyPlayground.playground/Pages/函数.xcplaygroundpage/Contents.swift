//: [Previous](@previous)

import Foundation


//// 函数
//func sum(num1: Int, num2: Int) -> Int {
//    return num1 + num2
//}
//sum(num1: 10, num2: 20)
//
//// 没有返回值的函数
//func sum1(num1: Int, num: Int) -> Void {
//    //函数体
//}
//
//func sum2(num1: Int, num: Int) -> () {
//    //函数体
//}
//
//func sum3(num1: Int, num: Int) {
//    //函数体
//}
//
//// 没有形参
//func afunction() -> Int {
//
//    return 10;
//}
//
//// 返回元组
//func getPoint() -> (Int, Int) {
//    return (10, 10);
//}
//var p = getPoint()
//p.0
//p.1
//
//func find(id: Int) -> (name: String, age: Int) {
//    if id > 0 {
//        return ("jack", 20);
//    } else {
//        return ("nobody", 0)
//    }
//}
//var people = find(id: 2)
//print("name=\(people.name), age=\(people.age)")

//// 外部参数名
//func addStudent(name: String, stu_age age: Int, stu_no no: Int) {
//
//}
//addStudent(name: "jack", stu_age: 20, stu_no: 19)

// 默认参数值
//func addStudent1(name: String = "rose", age: Int = 20) {
//    print("添加学生：name=\(name), age=\(age)")
//}
//addStudent1(name: "jack")
//addStudent1(name: "jack", age: 20)
//
//func addStudent2(name: String, _ age: Int = 20) { // 加一个 _ 就可以忽略外部参数名
//
//}
//addStudent2(name: "jack", 20)

// 可变参数
//func add(a: Int, b: Int, others: Int ...) -> Int {
//    var result = a + b
//    for number in others
//    {
//        result += number
//    }
//    return result
//}
//add(a: 1, b: 2)
//add(a: 1, b: 2, others: 3)
//add(a: 1, b: 2, others: 3, 4)

//// 常量和变量参数 默认参数是常量参数，不能在函数内修改
//func test(num: Int) {
//    num = 10
//}

//func append(string: String, suffix: String, count: Int) -> String
//{
//    var string = string
//    for _ in 0..<count {
//        string += suffix
//    }
//    return string
//}
//var appendString = append(string: "jack", suffix: "+", count: 4)

// 输入输出参数
//func num(num1: inout Int) {
//    num1 = 10
//}
//var aa = 20
//num(num1: &aa)
//aa

//// 不利用第三方变量交换2个变量的值
//func swap(num1: inout Int, num2: inout Int) {
//    num1 = num1 + num2
//    num2 = num1 - num2
//    num1 = num1 - num2
//}
//var aaa = 20
//var bbb = 10
//swap(&aaa, &bbb)
//aaa
//bbb

//func swap1(num1: inout Int, num2: inout Int) {
//    num1 = num1 ^ num2
//    num2 = num1 ^ num2
//    num1 = num1 ^ num2
//}
//var aaaa = 30
//var bbbb = 10
//swap1(num1: &aaaa, num2: &bbbb)
//aaaa
//bbbb


//// 输入输出参数不能传入常量或者字面量（比如10）作为参数值
//// 输入输出参数不能有默认值
//// 输入输出参数不能是可变参数
//// 输入输出参数不能使用let、var修饰
//
//// 可以实现函数的多返回值
//func sumAndMinus(num1: Int, num2: Int) -> (sum: Int, minus: Int) {
//    return (num1 + num2, num1 - num2)
//}
//var result = sumAndMinus(num1: 10, num2: 20)
//result.sum
//result.minus
//
//func sumAndMinus1(num1: Int, num2: Int, sum: inout Int, minus: inout Int) {
//    sum = num1 + num2
//    minus = num1 - num2
//}
//var sum = 0, minus = 0
//sumAndMinus1(num1: 20, num2: 5, sum: &sum, minus: &minus)
//sum
//minus
//
//
//// 函数类型
//
//// 利用函数类型定义变量
//func sum6(num1: Int, num2: Int) -> Int {
//    return num1 + num2
//}
//
//var fn: (Int, Int) -> Int = sum6
//fn(10, 20)
//var fn1 = sum6
//
//// 函数作为参数
//func printResult(fn: (Int, Int) -> Int, num1: Int, num2: Int) {
//    print("运行结果是：%d", fn(num1, num2))
//}
//func minus(num1: Int, num2: Int) -> Int {
//    return num1 - num2
//}
//printResult(fn: sum6, num1: 10, num2: 20)
//printResult(fn: minus, num1: 30, num2: 20)
//
//// 函数作为返回值
//func goToWork() {
//    print("上班去")
//}
//
//func haveFun() {
//    print("踢足球")
//}
//
//func howToDo(day: Int) -> (Void) -> Void {
//    if day == 6 || day == 7 {
//        return haveFun
//    } else {
//        return goToWork
//    }
//}
//
//var todo = howToDo(day: 6)
//todo()
//
//// 函数重载 ： 函数名相同，函数类型不同
//func sum7(num1: Int, num2: Int) -> Int {
//    return num1 + num2
//}
//
//func sum7(num1: Int, num2: Int, num3: Int) -> Int {
//    return num1 + num2 + num3
//}
//
//func sum7(num1: Int, num2: Int) -> Double {
//    return Double(num1) + Double(num2)
//}
//
////sum7(10, num2: 20) // 有歧义，不知道调用哪个，会报错
//var result1: Int = sum7(num1: 10, num2: 20)
//var result2: Double = sum7(num1: 20, num2: 30)
//
//
//// 嵌套函数
//func howToDo1(day: Int) -> (Void) -> Void {
//    func goToWork() {
//        print("上班去")
//    }
//
//    func haveFun() {
//        print("踢足球")
//    }
//    if day == 6 || day == 7 {
//        return haveFun
//    } else {
//        return goToWork
//    }
//}
//var todo1 = howToDo1(day: 5)
//todo1()
