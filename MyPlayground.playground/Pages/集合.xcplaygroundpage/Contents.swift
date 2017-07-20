//: [Previous](@previous)

import Foundation

//// 数组

var array = ["A", "B", "C", "D", "E", "F"]
var array2: [String] = ["A", "B", "C", "D", "E", "F"]
var array3: Array<String> = ["A", "B", "C", "D", "E", "F"]

var array4 = [Int]()
var array5 = Array<String>()

var array7: [Int] = [] // 指明类型就不是 NSArray
array7.append(2)
var array8: Array<String> = []
array8.append("abc")

//// 用下面三个方法将数组清空
//array = []
//array = [String]()
//array = Array<String>()

array7 = [Int](repeating: 0, count: 10) // 数组有10个元素，全都是 0
var array9 = [2, 3, 4]
var array10 = array7 + array9


array2.count
array2.isEmpty
array2.append("G")
array2 += ["H"]
array2 += ["I", "J", "K"]
array2.insert("hello", at: 0)
array2.remove(at: 0) // 有返回值，返回的就是被删除的元素
array2
array2.removeLast()
array2

array2[0]
array2[0] = "AA"
array2

array2[2...4] = ["CC", "DD", "EE", "FF"]
array2

array2[2...4] = ["Hello"]
array2

// for in 遍历
for index in 0..<array.count
{
    print(array[index])
}

for item in array
{
    print(item)
}

for (index, value) in array.enumerated()
{
    print(index, ":", value)
}


// 集合 Set
// 集合和数组非常相似，区别是集合中不会有重复的元素，集合中的成员是无序的
var set: Set = ["A", "B", "C", "D", "E", "F"]
set.insert("G")
set
set.remove("B")
set

// 交集、差集、并集、补集
var list1: Set = ["糖醋里脊", "宫保鸡丁", "水煮鱼", "鱼香肉丝"]
var list2: Set = ["四喜丸子", "宫保鸡丁", "水煮鱼"]
// 交集
list1.intersection(list2)
// 差集
list1.subtract(list2)
// 并集
list1.union(list2)
// 补集
list1.symmetricDifference(list2)


// 字典

var courses = [76: "慕课网", 77: "CSS3 3D 特效", 127: "玩儿转Swift"]
var websites = ["搜索引擎": "Google", "学习网站": "慕课网", "新闻网站": "网易新闻"]

var courses2: Dictionary<Int, String> = [76: "慕课网", 77: "CSS3 3D 特效", 127: "玩儿转Swift"]
var websites2: Dictionary<String, String> = ["搜索引擎": "Google", "学习网站": "慕课网", "新闻网站": "网易新闻"]

var courses3: [Int: String] = [76: "慕课网", 77: "CSS3 3D 特效", 127: "玩儿转Swift"]
var websites3: [String: String] = ["搜索引擎": "Google", "学习网站": "慕课网", "新闻网站": "网易新闻"]

var dict = Dictionary<Int, String>()
var dict2 = [Int: String]()

// 清空字典
websites = Dictionary<String, String>()
websites = [String: String]()
websites = [:]

courses2.count
courses2.isEmpty

courses2[76]
websites2["搜索引擎"]
courses2[73] // 可以传入任意的键，如果没有这个键，返回nil
"课程名称: " + courses[76]!
courses[73] = "只学有用的" // 添加一个数据
courses[76] = "打造你的2048" // 修改一个值
var oldValue = courses.updateValue("2048!", forKey: 76) // 返回的是原来这个键对应得值
oldValue

courses[73] = nil
courses

courses[73] = "只学有用的"
let oldValue2 = courses.removeValue(forKey: 73)
oldValue2
courses


for (key, value) in courses
{
    print("\(key): \(value)")
}

courses.keys
courses.values

for key in courses.keys // 遍历所有的key
{
    print(key)
}

for value in courses.values // 遍历所有的值
{
    print(value)
}
