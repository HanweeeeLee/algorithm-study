//
//  ViewController.swift
//  hashadNumber
//
//  Created by hanwe on 2021/07/02.
//

import Cocoa

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1:\(solution(10))") // true
        print("2:\(solution(12))") // true
        print("3:\(solution(11))") // false
        print("4:\(solution(13))") // false
    }
    
    func solution(_ x: Int) -> Bool {
        let strXArr = Array(String(x))
        
        var sum: Int = 0
        for i in 0..<strXArr.count {
            sum += Int(String(strXArr[i]))!
        }
        print("sum:\(sum)")
        if x % sum == 0 {
            return true
        } else {
            return false
        }
    }


}

