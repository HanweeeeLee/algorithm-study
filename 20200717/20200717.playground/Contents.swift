/*
 첫 번째 계산

 아이들은 여러 자리 숫자들을 더하기 위해서 우에서 좌로 숫자를 하나씩 차례대로 더 하라고 배웠다. 1을 한 숫자 위치에서 다음 자리로 더하기위해 이동하는 "한자리올림"연산을 많이 발견하는 것은 중요한 도전이 된다. 당신의 일은 교육자가 그들의 어려움을 평가하기 위하여, 덧셈 문제들의 각 집합에 대해서 한자리올림 연산들의 수를 계산하는 것이다.

 입력

 입력의 각 라인은 10개의 숫자들보다 미만인 양의 정수들 두 개를 포함한다. 입력의 마지막 라인은 0 0 을 포한한다.

 출력

 마지막을 제외한 입력의 각 라인에 대해서 당신은 두 숫자들을 더한 결과에서 한자리올림 연산들의 수를 아래 처럼 보여지는 형식으로 계산하여 출력해야 한다.

 입력 샘플

 123 456
 555 555
 123 594
 0 0

 출력 샘플

 No carry operation.
 3 carry operations.
 1 carry operation.

 http://codingdojang.com/scode/397
*/

import UIKit

var str = "Hello, playground"

func solution(firstInput:Int,secondInput:Int) {
    var firstArr:Array<Character> = Array(String(firstInput))
    var secondArr:Array<Character> = Array((String(secondInput)))
    
    let loopCnt:Int = (firstInput > secondInput) ? firstArr.count : secondArr.count
    var totalCnt:Int = 0
    var upperIsExist:Bool = false
    for _ in 0..<loopCnt {
        let upper:Int = upperIsExist ? 1 : 0
        if (Int(String(firstArr.last!))! + Int(String(secondArr.last!))! + upper) > 9 {
            upperIsExist = true
            totalCnt += 1
        }
        else {
            upperIsExist = false
        }
        firstArr.removeLast()
        secondArr.removeLast()
    }
    print("total:\(totalCnt)")
}

print("test")

solution(firstInput: 123, secondInput: 568)

