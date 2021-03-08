
/*
 
 A string S consisting of N characters is considered to be properly nested if any of the following conditions is true:

 S is empty;
 S has the form "(U)" or "[U]" or "{U}" where U is a properly nested string;
 S has the form "VW" where V and W are properly nested strings.
 For example, the string "{[()()]}" is properly nested but "([)()]" is not.

 Write a function:

 public func solution(_ S : inout String) -> Int

 that, given a string S consisting of N characters, returns 1 if S is properly nested and 0 otherwise.

 For example, given S = "{[()()]}", the function should return 1 and given S = "([)()]", the function should return 0, as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [0..200,000];
 string S consists only of the following characters: "(", "{", "[", "]", "}" and/or ")".
 
 */


import UIKit

var str = "Hello, playground"


enum pushChar:Character {
    case big = "["
    case mid = "{"
    case small = "("
}

enum popChar:Character {
    case big = "]"
    case mid = "}"
    case small = ")"
}

//public func solution(_ S : inout String) -> Int {//O(3**N)
//
//    var isRight:Bool = true
//
//    var stack:Array = Array<Character>()
//
//    for i in 0..<S.count {
//        switch Array(S)[i] {
//        case pushChar.big.rawValue:
//            stack.append(pushChar.big.rawValue)
//            break
//        case pushChar.mid.rawValue:
//            stack.append(pushChar.mid.rawValue)
//            break
//        case pushChar.small.rawValue:
//            stack.append(pushChar.small.rawValue)
//            break
//        case popChar.big.rawValue:
//            if stack.count > 0 {
//                if (stack.last!) != pushChar.big.rawValue {
//                    isRight = false
//                }
//                else {
//                    stack.removeLast()
//                }
//            }
//            else {
//                isRight = false
//            }
//            break
//        case popChar.mid.rawValue:
//            if stack.count > 0 {
//                if (stack.last!) != pushChar.mid.rawValue {
//                    isRight = false
//                    break
//                }
//                else {
//                    stack.removeLast()
//                }
//            }
//            else {
//                isRight = false
//            }
//            break
//        case popChar.small.rawValue:
//            if stack.count > 0 {
//                if (stack.last!) != pushChar.small.rawValue {
//                    isRight = false
//                    break
//                }
//                else {
//                    stack.removeLast()
//                }
//            }
//            else {
//                isRight = false
//            }
//            break
//        default:
//            break
//        }
//        if !isRight {
//            break
//        }
//    }
//
//    if stack.count > 0 {
//        isRight = false
//    }
//
//    return (isRight ? 1 : 0)
//}

public func solution(_ S : inout String) -> Int { //O(N)
    
    var isRight:Bool = true
    let charArr:Array = Array(S)
    var stack:Array = Array<Character>()
    
    for i in 0..<charArr.count {
        switch charArr[i] {
        case pushChar.big.rawValue:
            stack.append(pushChar.big.rawValue)
            break
        case pushChar.mid.rawValue:
            stack.append(pushChar.mid.rawValue)
            break
        case pushChar.small.rawValue:
            stack.append(pushChar.small.rawValue)
            break
        case popChar.big.rawValue:
            if stack.count > 0 {
                if (stack.last!) != pushChar.big.rawValue {
                    isRight = false
                }
                else {
                    stack.removeLast()
                }
            }
            else {
                isRight = false
            }
            break
        case popChar.mid.rawValue:
            if stack.count > 0 {
                if (stack.last!) != pushChar.mid.rawValue {
                    isRight = false
                    break
                }
                else {
                    stack.removeLast()
                }
            }
            else {
                isRight = false
            }
            break
        case popChar.small.rawValue:
            if stack.count > 0 {
                if (stack.last!) != pushChar.small.rawValue {
                    isRight = false
                    break
                }
                else {
                    stack.removeLast()
                }
            }
            else {
                isRight = false
            }
            break
        default:
            break
        }
        if !isRight {
            break
        }
    }
    
    if stack.count > 0 {
        isRight = false
    }
    
    return (isRight ? 1 : 0)
}

var inputStr:String = "{[()()]}"
var inputStr2:String = "([)()]"
var inputStr3:String = ")("


print("test1:\(solution(&inputStr))")
print("test2:\(solution(&inputStr2))")
print("test3:\(solution(&inputStr3))")



