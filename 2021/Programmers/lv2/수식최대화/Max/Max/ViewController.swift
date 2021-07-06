//
//  ViewController.swift
//  Max
//
//  Created by hanwe on 2021/07/06.
//

import Cocoa

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1: \(solution("100-200*300-500+20"))") // 60420
        print("1: \(solution("50*6-3*2"))") // 300
        print("1: \(solution("300*123-190-250*12+122-300"))") // 300
    }
    
    enum Symbol: String, CaseIterable {
        case m = "-"
        case p = "+"
        case u = "*"
    }
    
    var max: Int = 0
    func solution(_ expression: String) -> Int64 {
        max = 0
        let symbolArr: [Symbol] = [.m,.p,.u]
        for i in 0..<symbolArr.count {
            var symbolCopy = symbolArr
            let firstSymbol: Symbol = symbolCopy[i]
            symbolCopy.remove(at: i)
            for j in 0..<symbolCopy.count {
                var symbolCopyCopy = symbolCopy
                let secondSymbol: Symbol = symbolCopyCopy[j]
                symbolCopyCopy.remove(at: j)
                let thirdSymbol: Symbol = symbolCopyCopy[0]
                calc(origin: expression, first: firstSymbol, second: secondSymbol, third: thirdSymbol)
            }
        }
        
        return Int64(max)
    }
    
    func calc(origin: String, first: Symbol, second: Symbol, third: Symbol) {
        let firstResult = calcDetail(origin: origin, symbol: first)
        let secondResult = calcDetail(origin: firstResult, symbol: second)
        var thirdResult = calcDetail(origin: secondResult, symbol: third)
        if thirdResult.hasSuffix("!") {
            thirdResult.removeLast()
            thirdResult.insert("-", at: thirdResult.startIndex)
        }
        let result = abs(Int(thirdResult)!)
        if result > max {
            max = result
        }
    }
    func calcDetail(origin: String, symbol: Symbol) -> String {
        if origin == "" {
            fatalError()
        }
        var splited = origin.split(separator: Character(symbol.rawValue))
        while true {
            if splited.count == 1 {
                break
            }
            var frontStr = ""
            while true {
                if splited[0].last == "+" || splited[0].last == "*" || splited[0].isEmpty || splited[0].last == "-" {
                    break
                }
                frontStr.insert(splited[0].last!, at: frontStr.startIndex)
                splited[0].removeLast()
            }
            var backStr = ""
            while true {
                if splited[1].first == "+" || splited[1].first == "*" || splited[1].isEmpty || splited[1].first == "-" {
                    break
                }
                backStr.append(splited[1].first!)
                splited[1].removeFirst()
            }
            var newValue: Int = 0
            var minorNewValueFlag: Bool = false
            if frontStr.last == "!" {
                frontStr.removeLast()
                frontStr.insert("-", at: frontStr.startIndex)
            }
            if backStr.last == "!" {
                backStr.removeLast()
                backStr.insert("-", at: frontStr.startIndex)
            }
            switch symbol {
            case .m:
                newValue = Int(frontStr)! - Int(backStr)!
                if 0 > newValue {
                    minorNewValueFlag = true
                }
            case .p:
                newValue = Int(frontStr)! + Int(backStr)!
            case .u:
                newValue = Int(frontStr)! * Int(backStr)!
            }
            var newValueStr: String = "\(newValue)"
            if minorNewValueFlag {
                newValueStr.append("!")
                newValueStr.removeFirst()
            }
            if newValueStr.hasPrefix("-") {
                newValueStr.removeFirst()
                newValueStr.append("!")
            }
            let newLine: String = String(splited[0]) + newValueStr + String(splited[1])
            splited.removeFirst()
            splited.removeFirst()
            splited.insert(String.SubSequence(newLine), at: 0)
        }
        return String(splited[0])
    }


}

