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
        var arr = [Int].init(repeating: 0, count: n+1)
        var result = 0
        for index in 2...n {
            arr[index] = index
            
        }
        for index in 2...n {
            if arr[index] == 0 {
                continue
            }
            var j = index + index
            while(j <= n) {
                arr[j] = 0
                j += index
            }
        }
        for index in 2...n {
            if arr[index] != 0 {
                result += 1
            }
        }
        return result
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

