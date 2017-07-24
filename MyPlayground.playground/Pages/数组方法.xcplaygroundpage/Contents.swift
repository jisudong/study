//: [Previous](@previous)

import UIKit



let array = [1, 2, 3, 4]

// filter
// 过滤数组中不满足条件的元素
let filteredArray = array.filter { (a) -> Bool in
    a > 2
}

// map
// 将原数组中的元素映射到一个新的数组中
let mappedArray = array.map {
    $0 * 10
}
// 甚至可以改变元素类型
let mappedArray1: [String] = array.map {
    "\($0)"
}
struct Student {
    var name: String
    var age: Int
}
let studentList: [Student] = [
    Student(name: "小明", age: 12),
    Student(name: "小刚", age: 12),
    Student(name: "小红", age: 12),
    Student(name: "小丽", age: 12)
]
var nameList = studentList.map {
    $0.name
}

// flatMap
// flatMap会检查书中有没有嵌套数组，把嵌套数组解构再重组成一个数组
let colors = ["red", "blue", "yellow"]
let shapes = ["circle", "square", "triangle"]
let colorfulShapes = colors.flatMap { color in
    shapes.map({ shape in
        return (color + shape)
    })
}

// reduce 
// 对数组中的元素按照某种规则进行合并，得到一个返回值
let num = array.reduce(6) {
    print("\($0) -- \($1)")
    return $0 + $1
}

// sort
let sortArray = [1, 3, 2, 4]
let sortedArray = sortArray.sorted()
let sortedArray1 = sortArray.sorted {
    $0 > $1
}

// forEach
let imageArray = [Int]()
imageArray.map {
    $0 * 10
}.forEach {_ in
        
}
array.forEach {
    if $0 == 3 {
        return // 只会从当前的闭包中返回
    }
    print($0) // 会打印1、2、4
}

// contains
print(array.contains(2))

// indexOf
array.index(of: 3)

// prefix suffix
array.prefix(2)
array.suffix(2)
// 优化后的版本
array.prefix(upTo: 3)
array.suffix(from: 3)
// prefixThrough
array.prefix(through: 2) // 比 prefix(upTo:) 多返回一个元素

// dropFirst dropLast
array.dropLast()
array.dropFirst()
array.dropFirst(2)
array.dropLast(2)

// enumerate
for (i, item) in array.enumerated() {
    print("\(i) -- \(item)")
}


struct Person {
    var id = ""
    var name = ""
    var phone = ""
}
let personArray = [
    Person(id: "111", name: "小明", phone: "13878689865"),
    Person(id: "111", name: "李磊", phone: "13788074673"),
    Person(id: "111", name: "韩梅梅", phone: "13653179063"),
    Person(id: "111", name: "小刚", phone: "13597414579"),
]
func transform(chinese: String) -> String {
    let mutableStr = NSMutableString(string: chinese) as CFMutableString
    if CFStringTransform(mutableStr, nil, kCFStringTransformToLatin, false) &&
        CFStringTransform(mutableStr, nil, kCFStringTransformStripCombiningMarks, false) {
        return mutableStr as String
    } else {
        return ""
    }
}
let array1 = personArray.sorted {
    print("对比的对象：\($0.name), \($1.name)")
    // 同一中文字段，重复了多次transform
    return transform(chinese: $0.name) < transform(chinese: $1.name)
}

let array2 = personArray.map {
    // 将联系人对象和生成的拼音捆绑成元组，同一中文字段不会重复多次transform
    ($0, transform(chinese: $0.name))
}

let array3 = personArray.map {
    ($0, transform(chinese: $0.name))
}.sorted {
    $0.1 < $1.1
}.map {
    $0.0
}





