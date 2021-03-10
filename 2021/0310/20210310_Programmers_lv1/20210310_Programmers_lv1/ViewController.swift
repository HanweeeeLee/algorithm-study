//
//  ViewController.swift
//  20210310_Programmers_lv1
//
//  Created by hanwe on 2021/03/10.
//
//https://programmers.co.kr/learn/courses/30/lessons/12921

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("result1: \(solution(10))") //4
        print("result2: \(solution(5))") //3
    }
    
    
    func solution(_ n:Int) -> Int {
        var primeNumberCnt: Int = 0
        var checkArr: [Int] = [Int]()
        for i in 2...n {
            checkArr.append(i)
        }
        
        while true {
            if checkArr.count == 0 {
                break
            }
            let checkNumber: Int = checkArr.first!
            for i in 0..<checkArr.count {
                var isPrimeChecked: Bool = false
                if checkNumber == checkArr[i] {
                    primeNumberCnt += 1
                    isPrimeChecked = true
                }
                if isPrimeChecked {
                    isPrimeChecked = false
                    //todo 지금 i의 배수를 다 지워버리자.
                    removeDrainage(arr: &checkArr, origin: checkNumber)
                    break
                }
            }
        }
        return primeNumberCnt
    }
    
    func removeDrainage( arr: inout [Int], origin: Int) {
        var willRemoveIndexArr: [Int] = [Int]()
        for i in 0..<arr.count {
            if arr[i] % origin == 0 {
                willRemoveIndexArr.append(i)
            }
        }
        let sortedWillRemoved = willRemoveIndexArr.sorted(by: { $0 > $1 })
        for i in 0..<sortedWillRemoved.count {
            arr.remove(at: sortedWillRemoved[i])
        }
    }


//    func solution(_ n:Int) -> Int {
//        var primeNumberCnt: Int = 0
//        var primeNumbers:[Int] = [Int]()
//        for i in 2..<n+1 {
//            for j in 2..<i+1 {
//                if getSoutionUseUnderPrimeNumbers(checkNumber: i,primeNumbers: primeNumbers) { // 이방법으로 체크 가능
//                    primeNumberCnt += 1
//                    primeNumbers.append(i)
//                    break
//                }
//                if i == j { //끝까지 도착? 소수다
//                    primeNumberCnt += 1
//                    primeNumbers.append(i)
//                    break
//                }
//                if i%j == 0 { // 넌 소수가 아니야
//                    break
//                }
//            }
//        }
//        return primeNumberCnt
//    }
//
//    func getSoutionUseUnderPrimeNumbers(checkNumber: Int ,primeNumbers:[Int]) -> Bool {
//        var isPrimeNumber: Bool = true
//        for i in 0..<primeNumbers.count {
//            if (checkNumber % primeNumbers[i]) == 0 {
//                isPrimeNumber = false
//                break
//            }
//        }
//        return isPrimeNumber
//    }
    
}

