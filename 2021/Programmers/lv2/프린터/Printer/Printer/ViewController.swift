//
//  ViewController.swift
//  Printer
//
//  Created by hanwe lee on 2021/07/07.
//

import Cocoa
// https://programmers.co.kr/learn/courses/30/lessons/42587

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1: \(solution([2, 1, 3, 2], 2))") // 1
        print("2: \(solution([1, 1, 9, 1, 1, 1], 0))") // 5
    }
    
    var myPriority: Int = 0
    func solution(_ priorities:[Int], _ location: Int) -> Int {
        var copyP = priorities
        var stack: [Int] = []
        myPriority = copyP[location]
        copyP.remove(at: location)
        copyP.insert(-1, at: location)
        while true {
            if copyP.count == 0 {
                break
            }
            let item = copyP.first!
            var searchValue = -2
            if item == -1 {
                searchValue = myPriority
            } else {
                searchValue = item
            }
            if searchBigger(map: copyP, value: searchValue) {
                copyP.removeFirst()
                copyP.append(item)
            } else {
                copyP.removeFirst()
                stack.append(item)
                if item == -1 {
                    return stack.count
                }
            }
        }
        
        return -1
    }
    
    func searchBigger(map :[Int], value: Int) -> Bool {
        var returnValue: Bool = false
        
        for item in map {
            var compare = -10
            if item == -1 {
                compare = myPriority
            } else {
                compare = item
            }
            if compare > value {
                returnValue = true
                break
            }
        }
        
        return returnValue
    }


}

