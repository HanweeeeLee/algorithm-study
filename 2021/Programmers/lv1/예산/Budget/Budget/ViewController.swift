//
//  ViewController.swift
//  Budget
//
//  Created by hanwe on 2021/07/03.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("1: \(solution([1,3,2,5,4], 9))") // 3
        print("2: \(solution([2,2,3,3], 10))") // 4
    }
    
    func solution(_ d:[Int], _ budget:Int) -> Int {
        var myBudget: Int = budget
        var sum: Int = 0
        
        let sorted: [Int] = d.sorted(by: { $1 > $0 })
        for item in sorted {
            myBudget -= item
            if myBudget < 0 {
                break
            } else {
                sum += 1
            }
        }
        return sum
    }

}

