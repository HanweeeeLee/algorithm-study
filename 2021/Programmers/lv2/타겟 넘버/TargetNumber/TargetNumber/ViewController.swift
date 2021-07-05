//
//  ViewController.swift
//  TargetNumber
//
//  Created by hanwe lee on 2021/07/05.
//
//https://programmers.co.kr/learn/courses/30/lessons/43165?language=swift
import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("1:\(solution([1, 1, 1, 1, 1], 3))") // 5
    }
    
    var gTarget: Int = 0
    var totalCnt: Int = 0
    func solution(_ numbers: [Int], _ target: Int) -> Int {
        gTarget = target
        
        search(currentArr: numbers, plusFlag: true, sum: 0)
        search(currentArr: numbers, plusFlag: false, sum: 0)
        
        return totalCnt
    }
    
    func search(currentArr: [Int], plusFlag: Bool, sum: Int) {
        
        let first: Int = currentArr[0]
        var newCurrentArr = currentArr
        newCurrentArr.removeFirst()
        var newSum: Int = sum
        if plusFlag {
            newSum = newSum + first
        } else {
            newSum = newSum - first
        }
        if newCurrentArr.count == 0 {
            if newSum == gTarget {
                totalCnt += 1
            }
            return
        }
        search(currentArr: newCurrentArr, plusFlag: true, sum: newSum)
        search(currentArr: newCurrentArr, plusFlag: false, sum: newSum)
    }


}

