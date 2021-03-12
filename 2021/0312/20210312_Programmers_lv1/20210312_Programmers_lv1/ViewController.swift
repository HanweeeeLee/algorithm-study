//
//  ViewController.swift
//  20210312_Programmers_lv1
//
//  Created by hanwe on 2021/03/12.
//
//https://programmers.co.kr/learn/courses/30/lessons/12910?language=swift

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("result:\(solution([5, 9, 7, 10], 5))")
        
    }
    
    func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
        var returnArr: [Int] = [Int]()
        for i in 0..<arr.count {
            if arr[i]%divisor == 0 {
                returnArr.append(arr[i])
            }
        }
        if returnArr.count == 0 {
            returnArr.append(-1)
        }
        return returnArr.sorted(by: {$0 < $1})
    }


}

