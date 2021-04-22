//
//  ViewController.swift
//  QuickSortSwift
//
//  Created by hanwe lee on 2021/04/22.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let result1 = quickSort(sorted: [10,21,7,3,30,33,90,90,120,1])
        let result2 = quickSort(sorted: [1,4,2,5,7,3,6,8])
        let result3 = quickSort(sorted: [4,2,1,5,7,3,6,8])
        print("result1: \(result1)")
        print("result2: \(result2)")
        print("result3: \(result3)")
//        print("totalCnt: \(totalSearchCnt)")
    }
    
//    var totalSearchCnt: Int = 0
    
    func quickSort(sorted: [Int]) -> [Int] {
        if sorted.count == 0 {
            return []
        }
        
        var copySorted = sorted
        let pivot = sorted[0]
        var pivotIndex: Int = 0
        var checkedIndex: Int = 1
        
        for _ in 1..<copySorted.count {
            if pivot > copySorted[checkedIndex] {
                let tmp: Int = copySorted[checkedIndex]
                copySorted.remove(at: checkedIndex)
                copySorted.insert(tmp, at: pivotIndex)
                checkedIndex += 1
                pivotIndex += 1
            }
            else if pivot == copySorted[checkedIndex] {
                checkedIndex += 1
            }
            else {
                // 원래 오른쪽에 있었으니 냅둔다.
                checkedIndex += 1
            }
        }
        let leftRange = 0..<pivotIndex
        let rightRange = pivotIndex+1..<copySorted.count
        let leftArr: [Int] = Array(copySorted[leftRange])
        copySorted.removeSubrange(leftRange)
        copySorted.insert(contentsOf: quickSort(sorted: leftArr), at: 0)
        let rightArr: [Int] = Array(copySorted[rightRange])
        copySorted.removeSubrange(rightRange)
        copySorted.append(contentsOf: quickSort(sorted: rightArr))
        
        return copySorted
    }


}

