//
//  ViewController.swift
//  Internal
//
//  Created by hanwe on 2021/07/02.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("1:\(solution([1,2,3,4], [-3,-1,0,2]))") // 3
        print("1:\(solution([-1,0,1], [1,0,-1]))") // -2
        
    }
    
    func solution(_ a:[Int], _ b:[Int]) -> Int {
        var returnValue: Int = 0
        for i in 0..<a.count {
            returnValue += a[i]*b[i]
        }
        return returnValue
    }


}

