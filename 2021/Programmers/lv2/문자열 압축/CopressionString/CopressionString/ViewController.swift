//
//  ViewController.swift
//  CopressionString
//
//  Created by hanwe lee on 2021/07/05.
//

//https://programmers.co.kr/learn/courses/30/lessons/60057

import Cocoa

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1: \(solution("aabbaccc"))") // 7
        print("2: \(solution("ababcdcdababcdcd"))") // 9
        print("3: \(solution("abcabcdede"))") // 8
        print("4: \(solution("abcabcabcabcdededededede"))") // 14
        print("5: \(solution("xababcdcdababcdcd"))") // 17
    }

    func solution(_ s:String) -> Int {
        var minCnt: Int = s.count
        for i in 1...s.count { // i 가 몇자리씩 짜르느냐의 기준
            var copyS = s
            var beforeStack: String = ""
            var stackCnt: Int = 0
            var resultS: String = ""
            while true {
                if i > copyS.count {
                    var cntChar: String = ""
                    if stackCnt != 1 {
                        cntChar = "\(stackCnt)"
                    }
                    resultS = resultS + cntChar + beforeStack + copyS
                    break
                }
                var stack: String = ""
                for j in 0..<i {
                    guard let _ = copyS.first else {
                        break
                    }
                    let first: String = String(copyS.first!)
                    stack.append(first)
                    copyS.removeFirst()
                }
                if beforeStack == stack || beforeStack == "" {
                    if beforeStack == "" {
                        beforeStack = stack
                    }
                    stackCnt += 1
                } else {
                    var cntChar: String = ""
                    if stackCnt != 1 {
                        cntChar = "\(stackCnt)"
                    }
                    resultS = resultS + cntChar + beforeStack
                    stackCnt = 1
                    beforeStack = stack
                }
            }
            
//            print("resultS: \(resultS)")
            if minCnt > resultS.count {
                minCnt = resultS.count
            }
            
        }
        
        
        
        return minCnt
    }


}

