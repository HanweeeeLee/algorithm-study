//
//  ViewController.swift
//  MakePrimeNumber
//
//  Created by hanwe on 2021/07/02.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("1: \(solution([1,2,3,4]))") // 1
        print("1: \(solution([1,2,7,6,4]))") // 4
    }
    
    func solution(_ nums:[Int]) -> Int {
        var returnValue: Int = 0
        
        for i in 0..<nums.count-2 {
            for j in i+1..<nums.count-1 {
                for k in j+1..<nums.count {
                    if isPrimeNumber(nums[i]+nums[j]+nums[k]) {
//                        print("i: \(nums[i]), j: \(nums[j]), k: \(nums[k])")
//                        print("value:\(nums[i]+nums[j]+nums[k])")
                        returnValue += 1
                    }
                }
            }
        }
        
        return returnValue
    }
    
    func isPrimeNumber(_ inputed: Int) -> Bool {
        return inputed > 1 && !(2..<inputed).contains { inputed % $0 == 0 }
    }


}

