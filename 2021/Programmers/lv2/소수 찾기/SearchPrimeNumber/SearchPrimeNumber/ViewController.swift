//
//  ViewController.swift
//  SearchPrimeNumber
//
//  Created by hanwe lee on 2021/07/06.
//

import Cocoa

// https://programmers.co.kr/learn/courses/30/lessons/42839
class ViewController: NSViewController {

//    입출력 예
//    numbers    return
//    "17"    3
//    "011"    2

    override func viewDidLoad() {
        super.viewDidLoad()
        print("1: \(solution("17"))") // 3
        print("2: \(solution("011"))") // 2
    }

    var primeNumberCnt: Int = 0
    var registedPrimeNumberPool: Set<Int> = []
    func solution(_ numbers: String) -> Int {
        let numbersArr = Array(numbers)
        primeNumberCnt = 0
        registedPrimeNumberPool.removeAll()
        
        search(numbersArr, number: "")
        
        return primeNumberCnt
    }
    
    func isPrimeNumber(_ numbers: Int) -> Bool {
        if numbers <= 1 {
            return false
        }
        if numbers == 2 || numbers == 3 {
            return true
        }
        for index in 2...(numbers/2) {
            if numbers % index == 0 {
                return false
            }
        }
        return true
    }
    
    func search(_ map: [Character], number: String) {
        
        if map.count == 0 {
            return
        }
        for i in 0..<map.count {
            let item = map[i]
            var newNumber: String = number
            newNumber.append(item)
            let newNumberInt: Int = Int(newNumber)!
            if isPrimeNumber(newNumberInt) {
                if !registedPrimeNumberPool.contains(newNumberInt) {
                    primeNumberCnt += 1
                    registedPrimeNumberPool.insert(newNumberInt)
                }
            }
            var copyMap = map
            copyMap.remove(at: i)
            search(copyMap, number: newNumber)
        }
        
    }


}

