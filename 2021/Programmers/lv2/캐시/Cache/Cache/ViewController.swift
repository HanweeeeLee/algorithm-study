//
//  ViewController.swift
//  Cache
//
//  Created by hanwe on 2021/07/12.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("1: \(solution(3, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"]))") // 50
        print("2: \(solution(3, ["Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul"]))") // 21
        print("3: \(solution(2, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]))") // 60
        print("4: \(solution(5, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]))") // 52
        print("5: \(solution(2, ["Jeju", "Pangyo", "NewYork", "newyork"]))") // 16
        print("6: \(solution(0, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA"]))") // 25
    }
    
    func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
        var spendTime: Int = 0
        var queue: [String] = []
        
        for i in 0..<cities.count {
            if queue.contains(cities[i].lowercased()) {
                spendTime += 1
                renewQueue(queue: &queue, newElemnet: cities[i].lowercased())
            } else {
                spendTime += 5
                queue.append(cities[i].lowercased())
                if queue.count > cacheSize {
                    queue.removeFirst()
                }
            }
        }
        
        return spendTime
    }
    
    func renewQueue(queue: inout [String], newElemnet: String) {
        for i in 0..<queue.count {
            if queue[i] == newElemnet {
                queue.remove(at: i)
                queue.append(newElemnet)
                break
            }
        }
    }

}

