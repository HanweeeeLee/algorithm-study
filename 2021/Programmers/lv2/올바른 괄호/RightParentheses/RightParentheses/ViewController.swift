//
//  ViewController.swift
//  RightParentheses
//
//  Created by hanwe on 2021/07/08.
//

import Cocoa

class ViewController: NSViewController {

//    "()()"
//    "(())()"    true
//    ")()("    false
//    "(()("    false
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1: \(solution("()()"))") // true
        print("2: \(solution("(())()"))") // true
        print("3: \(solution(")()("))") // false
        print("4: \(solution("(()("))") // false
    }
    
    func solution(_ s: String) -> Bool {
        var point: Int = 0
        let sArr = Array(s)
        for i in 0..<sArr.count {
            if 0 > point {
                break
            }
            if sArr[i] == "(" {
                point += 1
            } else {
                point -= 1
            }
        }
        return point == 0 ? true : false
    }
    
//    func solution(_ s: String) -> Bool {
//        var ans: Bool = true
//        let sArr = Array(s)
//        var stack: String = ""
//
//        for i in 0..<sArr.count {
//            if stack.count > 0 {
//                if stack.last! == "(" && sArr[i] == ")" {
//                    stack.append(sArr[i])
//                    removeFunc(&stack)
//                } else {
//                    stack.append(sArr[i])
//                }
//            } else {
//                stack.append(sArr[i])
//            }
//        }
//        if stack.count > 0 {
//            ans = false
//        }
//
//        return ans
//    }
//
//    func removeFunc(_ stack: inout String) {
//        var removeFlag: Bool = false
//        while true {
//            if stack.count >= 2 {
//                let last: Character = stack.last!
//                stack.removeLast()
//                let compare: Character = stack.last!
//                if last == ")" && compare == "(" {
//                    stack.removeLast()
//                    removeFlag = true
//                } else {
//                    stack.append(last)
//                }
//            }
//            if !removeFlag {
//                break
//            }
//            removeFlag = false
//        }
//
//    }


}

