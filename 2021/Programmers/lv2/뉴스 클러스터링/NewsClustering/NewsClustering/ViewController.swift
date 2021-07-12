//
//  ViewController.swift
//  NewsClustering
//
//  Created by hanwe on 2021/07/12.
//

import Cocoa

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1:\(solution("FRANCE", "french"))") // 16384
        print("2:\(solution("handshake", "shake hands"))") // 65536
        print("3:\(solution("aa1+aa2", "AAAA12"))") // 43690
        print("4:\(solution("E=M*C^2", "e=m*c^2"))") // 65536
    }
    
    func solution(_ str1:String, _ str2:String) -> Int {
        var param1Dic: [String: Int] = setElements(str1)
        var param2Dic: [String: Int] = setElements(str2)
//        print("param1Dic: \(param1Dic) param2Dic: \(param2Dic)")
        
        var sumCnt: Int = getSumCnt(param1Dic, param2Dic)
        var dupCnt: Int = getDupCnt(param1Dic, param2Dic)
        var result: Float = Float(dupCnt)/Float(sumCnt)
        if sumCnt == 0 {
            result = 1
        }
        
        var realResult = result * 65536
        
        
        return Int(realResult)
    }
    
    func getSumCnt(_ param1: [String: Int], _ param2: [String: Int]) -> Int {
        var sumDic: [String: Int] = [:]
        
        let param1AllKeys = Array(param1.keys)
        let param2AllKeys = Array(param2.keys)
        
        var existKeyArr: [String] = []
        
        for item in param1AllKeys {
            sumDic[item] = param1[item]
        }
        
        for item in param2AllKeys {
            if sumDic[item] != nil {
                existKeyArr.append(item)
            } else {
                sumDic[item] = param2[item]
            }
        }
        
        for key in existKeyArr {
            let param1Cnt: Int = param1[key]!
            let param2Cnt: Int = param2[key]!
            if param1Cnt > param2Cnt {
                sumDic[key] = param1Cnt
            } else {
                sumDic[key] = param2Cnt
            }
        }
        
        var result: Int = 0
        let sumDicKeys = Array(sumDic.keys)
        for i in 0..<sumDicKeys.count {
            let item: Int = sumDic[sumDicKeys[i]]!
            result += item
        }
        
        return result
    }
    
    func getDupCnt(_ param1: [String: Int], _ param2: [String: Int]) -> Int {
        var tmpDic: [String: Int] = [:]
        
        let param1AllKeys = Array(param1.keys)
        let param2AllKeys = Array(param2.keys)
        
        var existKeyArr: [String] = []
        
        for item in param1AllKeys {
            tmpDic[item] = param1[item]
        }
        
        for item in param2AllKeys {
            if tmpDic[item] != nil {
                existKeyArr.append(item)
            }
        }
        
        var dupDic: [String: Int] = [:]
        for key in existKeyArr {
            let param1Cnt: Int = param1[key]!
            let param2Cnt: Int = param2[key]!
            if param1Cnt > param2Cnt {
                dupDic[key] = param2Cnt
            } else {
                dupDic[key] = param1Cnt
            }
        }
        
        var result: Int = 0
        let dupDicKeys = Array(dupDic.keys)
        for i in 0..<dupDicKeys.count {
            let item: Int = dupDic[dupDicKeys[i]]!
            result += item
        }
        
        return result
    }
    
    func setElements(_ inputed: String) -> [String: Int] {
        var returnDic: [String: Int] = [:]
        
        let inputedArr = Array(inputed)
        
        for i in 0..<inputedArr.count - 1 {
            let char1 = String(inputedArr[i]).lowercased()
            let char2 = String(inputedArr[i+1]).lowercased()
            if !(isAlphabet(inputed: char1) && isAlphabet(inputed: char2)) {
                continue
            }
            let newElement: String = char1 + char2
            if returnDic[newElement] == nil {
                returnDic[newElement] = 1
            } else {
                returnDic[newElement] = returnDic[newElement]! + 1
            }
        }
        
        return returnDic
    }
    
    func isAlphabet(inputed: String) -> Bool {
        if inputed == "a" || inputed == "b" || inputed == "c" || inputed == "d" || inputed == "e" || inputed == "f" || inputed == "g" || inputed == "h" || inputed == "i" || inputed == "j" || inputed == "k" || inputed == "l" || inputed == "m" || inputed == "n" || inputed == "o" || inputed == "p" || inputed == "q" || inputed == "r" || inputed == "s" || inputed == "t" || inputed == "u" || inputed == "v" || inputed == "w" || inputed == "x" || inputed == "y" || inputed == "z" {
            return true
        } else {
            return false
        }
    }


}

