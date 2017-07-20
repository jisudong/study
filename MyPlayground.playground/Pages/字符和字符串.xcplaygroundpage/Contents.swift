//: [Previous](@previous)

import Foundation

//var ch: Character = "1"
//
//// 字符群集扩展字符
//var word = "cafe"
//word += "\u{301}"
//
//var str = "Hello, playground"
//str.characters.count
//
//for character in str.characters
//{
//    print(character)
//}
//
//let greeting = "Guten Tag!"
//greeting.characters.count
//greeting.startIndex
//greeting[greeting.startIndex] // G
//
//greeting.endIndex
//greeting[greeting.index(before: greeting.endIndex)] // 得到前面一个索引  !
//
//greeting[greeting.index(after: greeting.startIndex)] // 得到后面一个索引  u
//
//let index = greeting.index(greeting.startIndex, offsetBy: 7)
//greeting[index] // a
//
//greeting[greeting.index(greeting.startIndex, offsetBy: 9, limitedBy: greeting.endIndex)!] // !
//
//let start1 = greeting.index(greeting.startIndex, offsetBy: 1)
//let end1  = greeting.index(greeting.startIndex, offsetBy: 5)
//greeting[start1...end1]
//
////使用characters属性的indices属性会创建一个包含全部索引的范围(Range)，用来在一个字符串中访问单个字符”
//for index in greeting.characters.indices
//{
//    print("\(greeting[index])", terminator: " ")
//}

//let num = "123.45"
//let deRange = num.range(of: ".")
//let wholeNumber = num[num.startIndex..<deRange!.lowerBound]

//var str2 = "hello"
//let start2 = str2.index(str2.startIndex, offsetBy: 1)
//let end2 = str2.index(str2.startIndex, offsetBy: 3)
//str2.removeSubrange(start2...end2)

//var str3 = "hello"
//let start3 = str3.index(str3.startIndex, offsetBy: 1)
//str3.remove(at: start3)
//str3

//var str4 = "hello"
//let start4 = str4.index(str4.startIndex, offsetBy: 1)
//let end4 = str4.index(str4.startIndex, offsetBy: 3)
//str4.replaceSubrange(start4...end4, with: "newwwwww")
//str4



// 字符串是值类型

//// 空字符串
//var strr = ""
//var strr2 = String()
//var strr3 = "hugaih"
//strr.isEmpty
//strr3.isEmpty


//// 字符串拼接
//var str1 = "123"
//var str2 = "456"
//var str3 = str1 + str2
//
//let i: Character = "!"
//str3.append(i)

//// 字符串插入
//var age = 10
//var hand = 2
//var str4 = "I have \(hand) hands, \(age) years old"
//var str5 = "I have " + String(hand) + " hands," + "\(age) years old"

//// 调用insert(_:at:)方法可以在一个字符串的指定索引插入一个字符。
//var welcome = "hello"
//let index = welcome.index(welcome.startIndex, offsetBy: 1)
//welcome.insert("!", at: index)

//// 调用insert(contentsOf:at:)方法可以在一个字符串的指定索引插入一个字符串。
//var welcome = "hello"
//welcome.insert(contentsOf: " there".characters, at: welcome.endIndex)


// 调用remove(at:)方法可以在一个字符串的指定索引删除一个字符。
//var welcome = "hello"
//let index = welcome.index(before: welcome.endIndex)
//welcome.remove(at: index)
//welcome

// 调用removeSubrange(_:)方法可以在一个字符串的指定索引删除一个子字符串。
//var welcome = "hello"
//let start = welcome.index(welcome.startIndex, offsetBy: 3)
//let range = start..<welcome.endIndex
//welcome.removeSubrange(range)


////强转
//var str6 = String(age)
//var str7 = "\(age)"

////基本上可以用任何你喜欢的字符作为常量和变量名
//let 😄 = "haha"
//let 牛逼 = "haha"

//let str_a = "abc"
//let str_b = "abc"
//let str_c = "abd"
//str_a == str_b
//str_a < str_c

//let str_d = "hello, world"
//str_d.hasPrefix("hello")
//str_d.hasSuffix("world")

//// 把一个句子中所有单词的字母大写/小写
//var str_e = "Hello, playground"
//str_e.uppercased()
//str_e.lowercased()


//var str_f = "    hello!!!    "
//str_f.trimmingCharacters(in: CharacterSet.whitespaces) //截取空白字符
//str_f.trimmingCharacters(in: CharacterSet(charactersIn: " !")) // 截取空格和！


//// split
//var str_g = "welcome to play swift!Step-by-Step learn from now"
//str_g.components(separatedBy: " ")
//str_g.components(separatedBy: CharacterSet(charactersIn: " !-"))


var str_h = "Welcome to Play Swift! Step by Step learn Swift language from now"
str_h.range(of: "Step")
str_h.range(of: "Step", options: String.CompareOptions.backwards, range: nil, locale: nil)
str_h.range(of: "welcome", options: String.CompareOptions.caseInsensitive, range: nil, locale: nil)

str_h.startIndex
str_h.endIndex
let strRange = Range(uncheckedBounds: (str_h.startIndex, str_h.endIndex))


