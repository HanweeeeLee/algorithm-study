/*
 http://codingdojang.com/scode/492
 
 앞의 문제들 중 비슷한 알고리즘이 있던 것 같지만, 같은 건 없다고 생각해서 올립니다. 문제를 푸는데 많은 approach가 있을 듯 싶습니다. 이 문제의 핵심은 비트 연산을 얼마나 잘 이해하고 있냐이기 때문에 비트 연산으로 풀어주세요.

 input은 int n을 입력 받아 첫번째 row는 (n-1)의 O와 X, 두번째 row는 (n-2)의 O와 XX, 세번째 row는 (n-3)의 0와 XXX... n번째 row는 n의 X을 출력하시오.

 입력 예시: 6

 출력 예시:

 OOOOOX

 OOOOXX

 OOOXXX

 OOXXXX

 OXXXXX

 XXXXXX
 
 */

import UIKit

var str = "Hello, playground"

func printSolution(n:UInt) {
    for i in 0..<n {
        var printStr:String = ""
        for _ in 0...i {
            printStr = printStr + "X"
        }
        for _ in i+1..<n {
            printStr = "O" + printStr
        }
        print("\(printStr)")
        print("\n")
    }
}

printSolution(n: 6)

