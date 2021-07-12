//
//  ViewController.swift
//  Bridge
//
//  Created by hanwe on 2021/07/12.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("1: \(solution(2, 10, [7,4,5,6]))") // 8
        print("2: \(solution(100, 100, [10]))") // 101
        print("3: \(solution(100, 100, [10,10,10,10,10,10,10,10,10,10]))") // 110
    }
    
    var canWeight: Int = 0
    var length: Int = 0
    func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
        var time: Int = 1
        canWeight = weight
        length = bridge_length
        
        var bridgeQueue: [Element] = []
        var currentIndex: Int = 0
        while true {
            if currentIndex < truck_weights.count {
                let newElemnet = truck_weights[currentIndex]
                if isCanUseBridge(queue: bridgeQueue, newElement: newElemnet) {
                    bridgeQueue.append(Element(weight: newElemnet, spendTime: 0))
                    currentIndex += 1
                }
            }
            
            for i in 0..<bridgeQueue.count {
                bridgeQueue[i].spendTime += 1
            }
            time += 1
            
            bridgeQueue = bridgeQueue.filter({ $0.spendTime < length})
            if currentIndex == truck_weights.count && bridgeQueue.count == 0 {
                break
            }
        }
        
        return time
    }
    
    struct Element {
        var weight: Int
        var spendTime: Int
    }
    
    func isCanUseBridge(queue: [Element], newElement: Int) -> Bool {
        var returnValue: Bool = true
        
        var queueWeight: Int = 0
        for item in queue {
            queueWeight += item.weight
        }
        if queueWeight + newElement > canWeight {
            returnValue = false
        }
        
        return returnValue
    }


}

