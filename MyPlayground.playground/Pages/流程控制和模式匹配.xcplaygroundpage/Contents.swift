//: [Previous](@previous)

import Foundation

////流程控制
//for i in 1...4 {
//    print(i)
//}
////忽略i
//for _ in 1...4 {
//    print("*********")
//}
//
//
//// switch
//// 不用写break
//let grade = "B"
//switch grade {
//case "A":
//    print("优秀等级")
//case "B":
//    print("良好等级")
//case "C":
//    print("中等等级")
//default:
//    print("未知等级")
//}
//
//// 每一个case后面必须有可以执行的语句
////switch grade {
////    case "A"；
////    case "B":
////default:
////    print("")
////}
//
//// 多条件匹配  用逗号隔开
//let score = 95
//switch score/10 {
//case 10, 9:
//    print("优秀")
//case 8, 7, 6:
//    print("及格")
//default:
//    print("不及格")
//}
//
//// 范围匹配
//let score1 = 95
//switch score1 {
//case 90...100:
//    print("优秀")
//case 60...89:
//    print("及格")
//default:
//    print("不及格")
//}
//// 注意: switch要保证处理所有可能的情况，不然会报错，所以default一定要加（如果已经处理了所有的情况就可以不用加default）
//
//// 匹配元组
//let point4 = (1, 1)
//switch point4 {
//case (0, 0) :
//    print("这个点在原点")
//case (_, 0) :
//    print("这个点在x轴上")
//case (0, _) :
//    print("这个点在y轴上")
//case (-2...2, -2...2) :
//    print("这个点在矩形框内")
//default:
//    print("这个点在其他位置")
//}
//
//// 数值绑定
//// 在case匹配的同时，可以将switch中的值绑定给一个特定的常量或者变量，以便在case后面的语句中使用
//let point5 = (10, 0)
//switch point5 {
//case (let x, 0) :
//    print("这个点在x轴上，x值是\(x)")
//case (0, let y) :
//    print("这个点在x轴上，x值是\(y)")
//case let (x, y) :
//    print("这个点的x值是\(x), y值是\(y)")
//}
//
//// switch 语句可以使用where来增加判断条件
//var point6 = (10, -10)
//switch point6 {
//case let (x, y) where x == y :
//    print("这个点在45°的直线上")
//case let (x, y) where x == -y :
//    print("这个点在135°的直线上")
//default :
//    print("这个点不在这2条线上")
//}
//
//// fallthrough ：执行完case后，会接着执行fallthrough后面的case或者default语句
//let num = 20
//var string = "\(num)是个"
//switch num {
//case 0...50 :
//    string += "0~50之间的"
//    fallthrough
//default :
//    string += "整数"
//}
//
//
//// 标签
//out :
//    for _ in 1...2 {
//        for _ in 1...3 {
//            print("做俯卧撑")
//            break out
//        }
//        print("休息一次")
//    }
//
//
//// API检测
//// 只指定主版本号
//if #available(iOS 10, *) {
//    // 在 iOS 使用 iOS 10 的 API
//} else {
//    // 使用先前版本的 iOS 的 API
//}
//// 也可以指定子版本号
//if #available(iOS 10.2, *) {
//
//} else {
//
//}


//// guard
//// 期望是参数 x 大于0使用 x 的值
//func fooManualCheck(x: Int?)
//{
//    if x == nil || x <= 0 {
//        //
//        return
//    }
//
//    // 使用x
//    x!.description
//    print(x!)
//}
//
//func fooBinding(x: Int?)
//{
//    if let x = x where x > 0 {
//        //使用x
//        x.description
//        print(x)
//    }
//
//    // 如果不符合判断条件，就执行下面的代码
//}
//
//func fooGuard(x: Int?)
//{
//    guard let x = x where x > 0 else {
//        // 变量不符合条件判断是，执行下面代码
//        return
//    }
//
//    // 使用x
//    x.description
//    print(x)
//}
//
//fooManualCheck(5)
//fooBinding(5)
//fooGuard(5)
//

// if case
let a = 3
//原来的写法
if a >= 0 && a <= 5 {
    print("include")
}
// 模式匹配写法
if case 0...5 = a {
    print("include")
}

let b = (5, "五元")
if case (_, "五元") = b {
    print(b.0)
}

// guard case
func someFunction(x: Int) {
    
    guard case 0...5 = x else {
        return
    }
    print(x)
}
someFunction(x: a)

// for case 
let array = [
    (name: "黑暗骑士", imdb: 9.0, year: 2008),
    (name: "星际穿越", imdb: 8.7, year: 2014),
    (name: "记忆碎片", imdb: 8.5, year: 2000)
]
for case let ("黑暗骑士", imdb, _) in array {
    print(imdb)
}
for case let (_, imdb, _) in array where imdb > 8.5 {
    print(imdb)
}
