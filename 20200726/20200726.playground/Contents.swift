/**
 문자열을 입력받아서, 같은 문자가 연속적으로 반복되는 경우에 그 반복 횟수를 표시하여 문자열을 압축하기.

 입력 예시: aaabbcccccca

 출력 예시: a3b2c6a1
 */


import UIKit

var str = "Hello, playground"

struct Current {
    var currentChar:String
    var currentCnt:Int
}

func solution(inputStr:String) {
    let inputStrArr:Array<Character> = Array(inputStr)
    var currentState:Current = Current(currentChar: "", currentCnt: 0)
    var resultStr:String = ""
    for i in 0..<inputStrArr.count {
        if String(inputStrArr[i]) == currentState.currentChar {
            currentState.currentCnt += 1
            continue
        }
        else {
            if currentState.currentChar != "" {
                resultStr = resultStr + currentState.currentChar + "\(currentState.currentCnt)"
            }
            currentState.currentCnt = 1
            currentState.currentChar = String(inputStrArr[i])
        }
    }
    resultStr = resultStr + currentState.currentChar + "\(currentState.currentCnt)"
    print("\(resultStr)")
}

solution(inputStr: "aaabbcccccca")
