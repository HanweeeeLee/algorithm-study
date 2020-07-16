/*
 
 입력
 첫째 줄에 투자액이 정수로 주어집니다. 두번째 줄에 투자기간이 정수로 주어집니다. 세번째 줄에 투자기간 중 일별 전일 대비 가치 변동이 각각 퍼센트 단위의 정수로 주어집니다.

 투자액은 100 이상 10000 이하의 정수입니다.
 투자 기간은 1 이상 10 이하의 정수입니다.
 일별 변동폭은 -100 이상 100 이하의 정수로 주어집니다.
 출력
 첫째 줄에 순이익을 소수점 첫째자리에서 반올림한 값으로 나타냅니다. 두번째 줄에 이익인지 손해인지 여부를 good, same, bad로 나타냅니다. 이익이면 good, 손해이면 bad, 첫째줄에서 출력한 순이익이 0이면 same울 출력합니다.

 예시
 입력 예시
 10000
 4
 10 -10 5 -5
 출력 예시
 -125
 bad
 
 */

import UIKit

var str = "Hello, playground"

func solution(amount:UInt,day:UInt,percent:Array<Int>) {
    var currentAmount:Float = Float(amount)
    for i in 0..<day {
        var isUnderZero:Bool = false
        if percent[Int(i)] < 0 {
            isUnderZero = true
        }
        var value = currentAmount * Float(abs(percent[Int(i)]))/100.0
        if isUnderZero {
            value -= 2 * value
        }
        currentAmount += value
    }
    let finalResult:Int = Int(String(format: "%.0lf", currentAmount)) ?? -1
    if finalResult > amount {
        print("\(finalResult - Int(amount))")
        print("good")
    }
    else if finalResult == amount {
        print("\(Int(amount))")
        print("same")
    }
    else {
        print("\(Int(amount) - finalResult)")
        print("bad")
    }
}

solution(amount: 10123, day: 4, percent: [10,-20,13,7])
