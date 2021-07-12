//
//  ViewController.swift
//  NextBiggerNumber
//
//  Created by hanwe on 2021/07/12.
//

import Cocoa

class ViewController: NSViewController {

//    n    result
//    78    83
//    15    23
    
//    조건 1. n의 다음 큰 숫자는 n보다 큰 자연수 입니다.
//    조건 2. n의 다음 큰 숫자와 n은 2진수로 변환했을 때 1의 갯수가 같습니다.
//    조건 3. n의 다음 큰 숫자는 조건 1, 2를 만족하는 수 중 가장 작은 수 입니다.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1: \(solution(78))") // 83
        print("1: \(solution(15))") // 23
    }
    
    func solution(_ n:Int) -> Int {
        var answer: Int = n
        
        while true {
            answer = answer + 1
            if getOnCnt(String(n, radix: 2)) == getOnCnt(String(answer, radix: 2)) {
                break
            }
        }
        
        return answer
    }
    
    func getOnCnt(_ binary: String) -> Int {
        var resultValue: Int = 0
        let arr = Array(binary)
        for item in arr {
            if item == "1" {
                resultValue += 1
            }
        }
        return resultValue
    }


}

