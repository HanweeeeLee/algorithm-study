/*
 
 http://codingdojang.com/scode/401?answer_mode=hide

 문제
 앞뒤가 같은 수는 바로 쓴 값과 거꾸로 쓴 값이 같은 수이다. 다음과 같은 예를 들 수 있다.

 1

 44

 101

 2002

 8972798

 1111111111111

 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 22, 33, 44, 55, 66, 77, 88, 99, 101, 111, ... 과 같이, 0 이상의 앞뒤가 같은 수를 크기 순으로 나열할 때, n 번째 수를 계산하는 프로그램을 작성하라.

 n은 1부터 시작하며 크기에는 제한이 없다.
 
 */

import UIKit

var str = "Hello, playground"

public func solution(n:Int) {
    var currentCheckCnt:Int = 0
    var currentCnt:Int = 0
    while true {
        currentCnt += 1
        if check(n: currentCnt) {
            currentCheckCnt += 1
        }
        if n == currentCheckCnt {
            print("결과 :\(currentCnt)")
            break
        }
    }
}

func check(n:Int) -> Bool {
    if n < 10 {
        return true
    }
    var compareStr:String = "\(n)"
    var compareStrArray:Array = Array(compareStr)
    let startIndex = compareStr.index(compareStr.startIndex, offsetBy: 0)
    let endIndex = compareStr.index(startIndex, offsetBy: compareStr.count/2)
    let firstHalfCompareStr:String = String(compareStr[startIndex..<endIndex])
    let reverseStr:String = String(compareStr.reversed())
    let startIndex2 = reverseStr.index(reverseStr.startIndex, offsetBy: 0)
    let endIndex2 = reverseStr.index(startIndex, offsetBy: reverseStr.count/2)
    let lastHalfCompareStr:String = String(reverseStr[startIndex2..<endIndex2])
    if firstHalfCompareStr == lastHalfCompareStr {
        return true
    }
    return false
}

solution(n: 50)
