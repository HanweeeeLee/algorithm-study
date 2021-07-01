//
//  ViewController.swift
//  FailurePercent
//
//  Created by hanwe on 2021/07/01.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("1: \(solution(5, [2, 1, 2, 6, 2, 4, 3, 3]))") // [3,4,2,1,5]
        print("2: \(solution(4, [4,4,4,4,4]))") // [4,1,2,3]
        print("3: \(solution(4, [1,3,1,1,1]))")
    }
    
    func solution(_ N: Int, _ stages: [Int]) -> [Int] {
        var returnArr: [Int] = []
        for i in 1..<N+1 {
            returnArr.append(i)
        }
        
        var sortedStages = stages.sorted(by: { $1 > $0 })
        var stagePercentDic: [Int: Float] = [Int: Float]()
        for i in 1..<N+1 {
            if sortedStages.count == 0 {
                stagePercentDic[i] = 0
                continue
            }
            var stayUserCnt: Int = 0
            var remianUserCnt: Int = sortedStages.count
            while true {
                if sortedStages.count == 0 {
                    stagePercentDic[i] = Float(stayUserCnt/remianUserCnt)
                    remianUserCnt = sortedStages.count
                    stayUserCnt = 0
                    break
                }
                
                if sortedStages.first == i {
                    stayUserCnt += 1
                    sortedStages.removeFirst()
                } else if sortedStages.first! > i {
                    stagePercentDic[i] = Float(Float(stayUserCnt)/Float(remianUserCnt))
                    remianUserCnt = sortedStages.count
                    stayUserCnt = 0
                    break
                }
            }
        }
//        print("stagePercentDic:\(stagePercentDic)")
        returnArr = returnArr.sorted(by: { stagePercentDic[$0]! > stagePercentDic[$1]! })
        
        return returnArr
    }


}

