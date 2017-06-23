//: [Previous](@previous)

import Foundation


//var a: Int = 20
//var b = 20

////最值
//UInt16.min
//UInt16.max


//如果一个数值超过存储范围，直接报错
//UInt16 = -1

////Double 至少15位小数， Float 至少6位小数
//let d1 = 12.5
//let d2 = 0.125e2 // 等于 0.125 * 10的2次方
//0xC.8p0


//// 数字格式
//let meney = 100_0000
//let meney2 = 001900

////类型别名
//typealias MyInt = Int

////赋值运算符没有返回值

////求余运算符
//9 % 4
//-9 % 4
//9 % -4
//-9 % -4
//8 % 2.5
//
////范围运算符
//a...b //闭合运算符   [a, b] 包括a和b
//a..<b //半闭合运算符 [a, b) 包括a 不包括b
//for i in 0..<5 {
//    print(i)
//}

////溢出运算符
//swift为了整型计算提供了5个&开头的溢出运算符，能对超出取值范围的数值进行灵活处理
// &+   &-   &*   &/   &%
//let x = UInt16.max
//let y = x &+ 1
//
//let xx = UInt16.min
//let yy = x &- 1
//
//let xxx = Int16.min
//let yyy = x &- 1


////Bool类型 真：true, 假：false     没有非0就是真的概念 if语句\三目运算符的条件必须是Bool类型
////if 10 {a = 5}
////let 10 ? 100 : 200

////let c = 20
////let d = c ? 100 : 200

//// nil 聚合运算符
//// a ?? b  ==>  a != nil ? a! : b
