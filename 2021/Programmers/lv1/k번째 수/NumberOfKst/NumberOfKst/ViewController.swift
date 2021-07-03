//
//  ViewController.swift
//  NumberOfKst
//
//  Created by hanwe on 2021/07/03.
//

import Cocoa

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1:\(solution([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]]))") // [5, 6, 3]
    }
    
    func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
        var returnValue: [Int] = []
        
        for item in commands {
            let startIndex = item[0] - 1
            let endIndex = item[1] - 1
            let searchIndex = item[2] - 1
            let cuted = Array(array[startIndex...endIndex]).sorted(by: {$1 > $0})
            returnValue.append(cuted[searchIndex])
        }
        
        
        return returnValue
    }

}

