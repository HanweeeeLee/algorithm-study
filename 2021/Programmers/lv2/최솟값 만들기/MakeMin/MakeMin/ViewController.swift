//
//  ViewController.swift
//  MakeMin
//
//  Created by hanwe on 2021/07/13.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("1: \(solution([1, 4, 2], [5, 4, 4]))") // 29
        print("1: \(solution([1,2], [3,4]))") // 10
        
    }
    
    func solution(_ A:[Int], _ B:[Int]) -> Int {
        let sortedA = A.sorted(by: {$1 > $0})
        let sortedB = B.sorted(by: {$0 > $1})
        
        var sum: Int = 0
        for i in 0..<sortedA.count {
            sum += sortedA[i] * sortedB[i]
        }

        return sum
    }
    
    


}

