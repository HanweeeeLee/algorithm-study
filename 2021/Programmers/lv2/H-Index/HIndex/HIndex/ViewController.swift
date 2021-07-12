//
//  ViewController.swift
//  HIndex
//
//  Created by hanwe on 2021/07/12.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print("1: \(solution([3, 0, 6, 1, 5]))") // 3
    }
    
    func solution(_ citations:[Int]) -> Int {
        var max: Int = 0
        for i in 0..<citations.count {
            let h: Int = i + 1
            var useCnt: Int = 0
            var unUseCnt: Int = 0
            for j in 0..<citations.count {
                if citations[j] >= h {
                    useCnt += 1
                    continue
                }
                if h >= citations[j] {
                    unUseCnt += 1
                }
            }
            if useCnt >= h  {
                if h > max {
                    max = h
                }
            }
            
        }
        
        return max
    }


}

