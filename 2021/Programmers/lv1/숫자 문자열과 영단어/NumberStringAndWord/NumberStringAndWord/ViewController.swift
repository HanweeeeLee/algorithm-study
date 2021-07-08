//
//  ViewController.swift
//  NumberStringAndWord
//
//  Created by hanwe lee on 2021/07/08.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("1: \(solution("one4seveneight"))") // 1478
        print("2: \(solution("23four5six7"))") //234567
        print("3: \(solution("2three45sixseven"))") // 234567
        print("4: \(solution("123"))") // 123
    }
    
    enum Word: String, CaseIterable {
        case none = "_"
        case zero = "zero"
        case one = "one"
        case two = "two"
        case three = "three"
        case four = "four"
        case five = "five"
        case six = "six"
        case seven = "seven"
        case eight = "eight"
        case nine = "nine"
        
        static func getWord(_ inputed: String) -> Word {
            var returnValue: Word = .none
            
            for item in Word.allCases {
                if inputed == item.rawValue {
                    returnValue = item
                    break
                }
            }
                
            return returnValue
        }
    }
    
    func solution(_ s:String) -> Int {
        var copyS = s
        var stack: String = ""
        var result: String = ""
        while true {
            if copyS == "" || copyS.isEmpty || copyS.count == 0 {
                break
            }
            let item = copyS.first!
            copyS.removeFirst()
            if item == "0" || item == "1" || item == "2" || item == "3" || item == "4" || item == "5" || item == "6" || item == "7" || item == "8" || item == "9" {
                result.append(item)
                stack = ""
                continue
            }
            stack.append(item)
            switch Word.getWord(stack) {
            case .none:
                continue
            case .zero:
                stack = ""
                result.append("0")
            case .one:
                stack = ""
                result.append("1")
            case .two:
                stack = ""
                result.append("2")
            case .three:
                stack = ""
                result.append("3")
            case .four:
                stack = ""
                result.append("4")
            case .five:
                stack = ""
                result.append("5")
            case .six:
                stack = ""
                result.append("6")
            case .seven:
                stack = ""
                result.append("7")
            case .eight:
                stack = ""
                result.append("8")
            case .nine:
                stack = ""
                result.append("9")
            }
            
            
            
        }
        
        
        
        
        return Int(result)!
    }
    
    


}

