//
//  ViewController.swift
//  Compression
//
//  Created by hanwe on 2021/07/13.
//

import Cocoa

class ViewController: NSViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        print("1: \(solution("KAKAO"))") // [11, 1, 27, 15]
        print("2: \(solution("TOBEORNOTTOBEORTOBEORNOT"))") // [20, 15, 2, 5, 15, 18, 14, 15, 20, 27, 29, 31, 36, 30, 32, 34]
        print("3: \(solution("ABABABABABABABAB"))") // [1, 2, 27, 29, 28, 31, 30]
    }
    
//    길이가 1인 모든 단어를 포함하도록 사전을 초기화한다. - c
//    사전에서 현재 입력과 일치하는 가장 긴 문자열 w를 찾는다.
//    w에 해당하는 사전의 색인 번호를 출력하고, 입력에서 w를 제거한다.
//    입력에서 처리되지 않은 다음 글자가 남아있다면(c), w+c에 해당하는 단어를 사전에 등록한다.
//    단계 2로 돌아간다.
    func solution(_ msg: String) -> [Int] {
        var dic: [String: Int] = addAlphabet()
        var resultArr: [Int] = []
        var msgArr = Array(msg)
        
        var stack: String = ""
        while true {
            if msgArr.count == 0 && stack == "" {
                break
            }
            if msgArr.count == 0 && stack.count >= 1 {
                if dic[stack] == nil {
                    dic[stack] = dic.count + 1
                }
                resultArr.append(dic[stack]!)
                stack = ""
                continue
            }
            let newElement = msgArr.first!
            stack.append(newElement)
            msgArr.removeFirst()
            if dic[stack] != nil {
                continue
            } else {
                dic[stack] = dic.count + 1
                let oldElement = String(stack.last!)
                stack.removeLast()
                msgArr.insert(contentsOf: oldElement, at: 0)
                resultArr.append(dic[stack]!)
                stack = ""
            }
        }
        
        
        return resultArr
    }
    
    func addAlphabet() -> [String: Int] {
        var returnDic: [String: Int] = [:]
        returnDic["A"] = 1
        returnDic["B"] = 2
        returnDic["C"] = 3
        returnDic["D"] = 4
        returnDic["E"] = 5
        returnDic["F"] = 6
        returnDic["G"] = 7
        returnDic["H"] = 8
        returnDic["I"] = 9
        returnDic["J"] = 10
        returnDic["K"] = 11
        returnDic["L"] = 12
        returnDic["M"] = 13
        returnDic["N"] = 14
        returnDic["O"] = 15
        returnDic["P"] = 16
        returnDic["Q"] = 17
        returnDic["R"] = 18
        returnDic["S"] = 19
        returnDic["T"] = 20
        returnDic["U"] = 21
        returnDic["V"] = 22
        returnDic["W"] = 23
        returnDic["X"] = 24
        returnDic["Y"] = 25
        returnDic["Z"] = 26
        return returnDic
    }


}

