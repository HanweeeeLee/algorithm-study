//
//  ViewController.swift
//  AddDenominator
//
//  Created by hanwe on 2021/07/03.
//

import Cocoa

class ViewController: NSViewController {
    
//    13    17    43
//    24    27    52

    override func viewDidLoad() {
        super.viewDidLoad()
        print("1: \(solution(13, 17))") // 43
        print("2: \(solution(24, 27))") // 52
    }

    func solution(_ left:Int, _ right:Int) -> Int {
        
        var sum: Int = 0
        for i in left...right {
            var denominatorCnt: Int = 0
            for j in 1...i {
                if i%j == 0 {
                    denominatorCnt += 1
                }
            }
            if denominatorCnt % 2 == 0 {
                sum += i
            } else {
                sum -= i
            }
        }
        
        return sum
    }


}

