//
//  ViewController.swift
//  BegestNumber
//
//  Created by hanwe lee on 2021/07/06.
//

import Cocoa


class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("1:\(solution([6, 10, 2]))") // "6210"
        print("2:\(solution([3, 30, 34, 5, 9]))") // "9534330"
    }
    
    func solution(_ numbers: [Int]) -> String {
        var strings = numbers.map{ String($0) }
        strings.sort{ $0 + $1 > $1 + $0 }
        print("strings: \(strings)")
        let answer = strings.joined()
        if let num = Int(answer) { return String(num) }
        return answer
    }
    
    
    
    
    
    
    
    
    
    
    
    
//    func makeMerge(_ origin: [Int], mergeStr: String) {
//        if origin.count == 0 {
//            if isBiggerThanMax(mergeStr) {
//                maxNum = mergeStr
//            }
//            return
//        }
//
//        for i in 0..<origin.count {
//            var copyMergeStr = mergeStr
//            var copyOrigin = origin
//            let itemStr = "\(origin[i])"
//            copyOrigin.remove(at: i)
//            copyMergeStr.append(itemStr)
//            makeMerge(copyOrigin, mergeStr: copyMergeStr)
//        }
//    }
//
//    func isBiggerThanMax(_ inputed: String) -> Bool {
//        var returnValue: Bool = false
//        if inputed.count > maxNum.count {
//            returnValue = true
//        } else if inputed.count == maxNum.count {
//            var inputedArr = Array(inputed)
//            var maxNumArr = Array(maxNum)
//            for _ in 0..<maxNum.count {
//                let inputedFirst = String(inputedArr.first!)
//                let maxNumFirst = String(maxNumArr.first!)
//                if Int(inputedFirst)! > Int(maxNumFirst)! {
//                    returnValue = true
//                    break
//                } else if Int(inputedFirst)! == Int(maxNumFirst)! {
//                    inputedArr.removeFirst()
//                    maxNumArr.removeFirst()
//                } else {
//                    break
//                }
//            }
//        }
//
//        return returnValue
//    }


}

