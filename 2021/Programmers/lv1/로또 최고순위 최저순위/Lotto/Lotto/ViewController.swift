//
//  ViewController.swift
//  Lotto
//
//  Created by hanwe on 2021/07/03.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("1: \(solution([44, 1, 0, 0, 31, 25], [31, 10, 45, 1, 6, 19]))") // [3, 5]
        print("2: \(solution([0, 0, 0, 0, 0, 0], [38, 19, 20, 40, 15, 25]))") // [1, 6]
        print("3: \(solution([45, 4, 35, 20, 3, 9], [20, 9, 3, 45, 4, 35]))") // [1, 1]
    }
    
    func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
        // 1. 현재 몇개까지 맞추었나
        // 2. 나머지의 최고 최저
        // 3. 겟 등수
        var hitCnt: Int = 0 // 맞춘갯수 (확정)
        var hiddenCnt: Int = 0 // 누락된 숫자의 갯수
        
        let sortedLottos = lottos.sorted(by: { $0 < $1 })
        for item in sortedLottos {
            if item != 0 {
                if win_nums.contains(item) {
                    hitCnt += 1
                }
            } else {
                hiddenCnt += 1
            }
        }
        
        let ifHighestHitCnt: Int = hitCnt + hiddenCnt
        let iflowestHitCnt: Int = hitCnt
        
        
        return [getRanking(hitCnt: ifHighestHitCnt), getRanking(hitCnt: iflowestHitCnt)]
    }
    
    func getRanking(hitCnt: Int) -> Int {
        switch hitCnt {
        case 6:
            return 1
        case 5:
            return 2
        case 4:
            return 3
        case 3:
            return 4
        case 2:
            return 5
        default:
            return 6
        }
    }


}

