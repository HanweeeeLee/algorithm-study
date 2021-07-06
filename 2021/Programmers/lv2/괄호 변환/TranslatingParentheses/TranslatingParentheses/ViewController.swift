//
//  ViewController.swift
//  TranslatingParentheses
//
//  Created by hanwe lee on 2021/07/06.
//

import Cocoa
//https://programmers.co.kr/learn/courses/30/lessons/60058?language=swift

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("1: \(solution("(()())()"))") // "(()())()"
        print("2: \(solution(")("))")  // "()"
        print("3: \(solution("()))((()"))") // "()(())()"
        print("4: \(solution("(("))") // "()"
    }

    func solution(_ p: String) -> String {
        if p == "" {
            return ""
        }
        var copyP = p
        
        var u = seperateString(&copyP)
        let v = copyP
        
        if isRightString(u) {
            let result = solution(v)
            u += result
        } else {
            var emptyString: String = "("
            let result = solution(v)
            emptyString += result
            emptyString.append(")")
            emptyString.append(reverseU(u))
            return emptyString
        }
        
        
        return u
    }
    
    func reverseU(_ inputed: String) -> String {
        var returnValue = ""
        var copyInputed: String = inputed
        if copyInputed.count >= 2 {
            copyInputed.removeFirst()
            copyInputed.removeLast()
            for item in copyInputed {
                if item == "(" {
                    returnValue.append(")")
                } else {
                    returnValue.append("(")
                }
            }
        }
        
        return returnValue
    }
    
    func seperateString(_ origin: inout String) -> String {
        var returnValue: String = ""
        var openCnt: Int = 0
        var closeCnt: Int = 0
        
        while true {
            if (openCnt != 0) && (closeCnt != 0) && (openCnt == closeCnt) {
                break
            }
            if origin.count == 0 {
                break
            }
            let item = origin.first!
            if item == "(" {
                openCnt += 1
            } else {
                closeCnt += 1
            }
            origin.removeFirst()
            returnValue.append(item)
        }
        return returnValue
    }
    
    func isRightString(_ inputed: String) -> Bool {
        var returnValue: Bool = true
        
        let inputedArr = Array(inputed)
        if inputedArr.count > 0 {
            var stack: String = ""
            for i in 0..<inputedArr.count {
                stack.append(String(inputedArr[i]))
                removeParentheses(&stack)
            }
            if stack.count != 0 {
                returnValue = false
            }
        }
        return returnValue
    }
    
    func removeParentheses(_ inputed: inout String) {
        if inputed.count >= 2 {
            let last: String = String(inputed.last!)
            inputed.removeLast()
            let pair = String(inputed.last!)
            if last == ")" && pair == "(" {
                inputed.removeLast()
                removeParentheses(&inputed)
            } else {
                inputed.append(last)
                return
            }
        }
    }

}

