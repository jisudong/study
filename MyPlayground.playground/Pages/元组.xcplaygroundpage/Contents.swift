//: [Previous](@previous)

import Foundation

// 元组类型 ： 元组类型由N个任意类型的数据组成
//var position = (x: 10.5, y: 20)
//let person = (name : "jack")
//let data = () // 空元组
//
////元组元素访问
//let point = (x : 10, y : 20)
//
////元素名称
//point.x
//point.y
//
////元素位置
//point.0
//point.1
//
//let value = position.x
//position.y = 50
//
//// 如果用let 声明一个元组，就不能修改元素的值
//
//// 可以明确声明元素的类型
//var person1: (Int, String) = (20, "jack")
//var person2: (Int, String) = (age: 20, name: "jack")
//
////可以用多个变量接收元组数据
//var (x1, y1) = (10, 20)
//var point2 = (x1, y1)
//
////可以将元素分别赋值给多个变量
//var point3 = (10, 20)
//var (x2, y2) = point3
//x2
//y2
//
////可以使用下划线_忽略某个元素的值，取出其他元素的值
//var person3 = (20, "jack")
//var (_, name) = person3
//name
