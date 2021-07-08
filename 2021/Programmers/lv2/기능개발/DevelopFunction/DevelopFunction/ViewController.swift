//
//  ViewController.swift
//  DevelopFunction
//
//  Created by hanwe lee on 2021/07/07.
//
//https://programmers.co.kr/learn/courses/30/lessons/42586

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let test1 = solution([93, 30, 55], [1, 30, 5]) // [2, 1]
        let test2 = solution([95, 90, 99, 99, 80, 99], [1, 1, 1, 1, 1, 1]) // [1, 3, 2]
        print("test1: \(test1)")
        print("test2: \(test2)")
    }

    func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
        var returnValue: [Int] = []
        var copyProgresses = progresses
        var copySpeeds = speeds
        while true {
            if copyProgresses.count == 0 {
                break
            }
            let first = copyProgresses[0]
            if first >= 100 {
                let distributeCnt: Int = getCompletWorkCnt(works: copyProgresses)
                returnValue.append(distributeCnt)
                for _ in 0..<distributeCnt {
                    copyProgresses.removeFirst()
                    copySpeeds.removeFirst()
                }
            }
            for i in 0..<copyProgresses.count {
                copyProgresses[i] += copySpeeds[i]
            }
        }
        
        
        return returnValue
    }
    
    func getCompletWorkCnt(works: [Int]) -> Int {
        var returnValue: Int = 0
        for item in works {
            if item >= 100 {
                returnValue += 1
            } else {
                break
            }
        }
        return returnValue
    }

}

