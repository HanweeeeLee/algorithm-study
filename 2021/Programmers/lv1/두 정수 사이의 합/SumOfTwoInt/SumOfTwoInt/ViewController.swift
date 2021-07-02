//
//  ViewController.swift
//  SumOfTwoInt
//
//  Created by hanwe on 2021/07/02.
//

import Cocoa

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1:\(solution(3, 5))") // 12
        print("2:\(solution(3, 3))") // 3
        print("3:\(solution(5, 3))") // 12
    }
    
    func solution(_ a: Int, _ b: Int) -> Int64 {
        var returnValue: Int = 0
        let inputedArr: [Int] = [a, b].sorted(by: { $1 > $0 })
        
        for i in inputedArr[0] ... inputedArr[1] {
            returnValue += i
        }
        return Int64(returnValue)
    }
}

