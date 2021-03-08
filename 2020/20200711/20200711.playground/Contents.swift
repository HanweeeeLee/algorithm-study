/*
 
 0~9까지의 문자로 된 숫자를 입력 받았을 때, 이 입력 값이 0~9까지의 숫자가 각각 한 번 씩만 사용된 것인지 확인하는 함수를 구하시오.

 sample inputs: 0123456789 01234 01234567890 6789012345 012322456789

 sample outputs: true false false true false
 
 */


import UIKit

var str = "Hello, playground"

func solution(input:Int) -> Bool {
    var checkDic:Dictionary = [String:Bool]()
    let inputArr:Array = Array(String(input))
    for i in 0..<inputArr.count {
        if checkDic[String(inputArr[i])] != nil {
            return false
        }
        else {
            checkDic[String(inputArr[i])] = true
        }
    }
    return true
}

if solution(input: 012322456789) {
    print("true")
}
else {
    print("false")
}
