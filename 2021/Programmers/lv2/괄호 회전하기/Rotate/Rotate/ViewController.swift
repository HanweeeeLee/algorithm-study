//
//  ViewController.swift
//  Rotate
//
//  Created by hanwe on 2021/07/12.
//

import Cocoa

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1: \(solution("[](){}"))") // 3
        print("1: \(solution("}]()[{"))") // 2
        print("1: \(solution("[)(]"))") // 0
        print("1: \(solution("}}}"))") // 0
    }
    
    func solution(_ s:String) -> Int {
        var rightCnt: Int = 0
        var copyS = s
        for _ in 0..<s.count {
            let last = copyS.last!
            copyS.removeLast()
            copyS.insert(last, at: copyS.startIndex)
//            print("copys: \(copyS)")
            if isRightString(copyS) {
//                print("isRight")
                rightCnt += 1
            }
        }
        
        return rightCnt
    }
    
    func isRightString(_ inputed: String) -> Bool {
        var isRight: Bool = true
        
        var stack: String  = ""
        
        for item in inputed {
            stack.append(item)
            remove(&stack)
        }
        
        if stack.count > 0 {
            isRight = false
        }
        
        return isRight
    }
    
    func remove(_ inputed: inout String) {
        while true {
            if inputed.count < 2 {
                break
            }
            let last = inputed.last!
            inputed.removeLast()
            let compare = inputed.last!
            if (last == "]" && compare == "[") || (last == "}" && compare == "{") || (last == ")" && compare == "(") {
                inputed.removeLast()
                continue
            } else {
                inputed.append(last)
                break
            }
        }
        
    }


}

