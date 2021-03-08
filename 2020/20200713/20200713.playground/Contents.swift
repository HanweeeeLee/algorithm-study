/*
 
 http://codingdojang.com/scode/691?answer_mode=hide

 출처: <프로젝트 오일러 49번 문제>

 1487, 4817, 8147은 3330씩 증가하는 등차수열(arithmetic sequence)이다. 이 세 개의 수는 특이한 점이 있는데, 셋 다 소수이면서, 셋은 서로 자리에 있는 숫자만 바꾼 수들이라는 것이다.

 이러한 특성(+-3330 등차수열, 소수, 자리만 바꾼 수)을 보이는 한 자리, 두 자리, 세 자리인 소수는 없다. 그러나 네 자리 숫자 중 이러한 특성을 보이는 숫자들이 한 세트 더 있다.

 이 숫자들을 작은 것부터 순서대로 연결하여 만들 수 있는 12자리 숫자는 무엇인가? 예) 1487, 4817, 8147 -> 148748178147
 
 */

import UIKit

var str = "Hello, playground"

func solution() -> CLongLong {
    
    for i in 1000..<3341 {
        var combinationCheckDic:Dictionary = [Character:Int]()
        if i == 1487 {
            continue
        }
        if checkPrimeNumver(input: i) {
            let tmpArr1:Array = Array(String(i))
            for i in 0..<tmpArr1.count {
                if combinationCheckDic[tmpArr1[i]] == nil {
                    combinationCheckDic[tmpArr1[i]] = 1
                }
                else {
                    combinationCheckDic[tmpArr1[i]]! += 1
                }
            }
            if checkPrimeNumver(input: i+3330) {
                let tmpArr2:Array = Array(String(i+3330))
                var copyDic = combinationCheckDic
                for i in 0..<tmpArr2.count {
                    if copyDic[tmpArr2[i]] == nil {
                        break
                    }
                    else {
                        copyDic[tmpArr2[i]]! -= 1
                        if copyDic[tmpArr2[i]]! == 0 {
                            copyDic[tmpArr2[i]] = nil
                        }
                    }
                }
                if copyDic.count > 0 {
                    continue
                }
                if checkPrimeNumver(input: i+6660) {
                    let tmpArr3:Array = Array(String(i+6660))
                    for i in 0..<tmpArr3.count {
                        if copyDic[tmpArr3[i]] == nil {
                            break
                        }
                        else {
                            copyDic[tmpArr3[i]]! -= 1
                            if copyDic[tmpArr3[i]]! == 0 {
                                copyDic[tmpArr3[i]] = nil
                            }
                        }
                    }
                    if copyDic.count > 0 {
                        continue
                    }
                    return CLongLong(String("\(i)"+"\(i+3330)"+"\(i+6660)")) ?? -1
                }
            }
        }
    }
    return -1
}

func checkPrimeNumver(input:Int) -> Bool {
    var isPrimeNumber:Bool = true
    if input > 2 {
        for i in 2..<input {
            if input%i == 0 {
                isPrimeNumber = false
                break
            }
        }
    }
    return isPrimeNumber
}

print("solution:\(solution())")
