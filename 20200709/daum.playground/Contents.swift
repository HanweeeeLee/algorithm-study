/*
 
 http://codingdojang.com/scode/408?answer_mode=hide
 
 1차원의 점들이 주어졌을 때, 그 중 가장 거리가 짧은 것의 쌍을 출력하는 함수를 작성하시오. (단 점들의 배열은 모두 정렬되어있다고 가정한다.)

 예를들어 S={1, 3, 4, 8, 13, 17, 20} 이 주어졌다면, 결과값은 (3, 4)가 될 것이다.
 
 */

import UIKit

var str = "Hello, playground"

func solution(inputArr:Array<Int>) {
    var min:Int = 0
    if inputArr.count > 1 {
        
        min = inputArr[1] - inputArr[0]
        for i in 1..<inputArr.count-1 {
            if min > (inputArr[i+1] - inputArr[i]) {
                min = (inputArr[i+1] - inputArr[i])
            }
            if min == 1 {
                break
            }
        }
        print("(\(inputArr[min]), \(inputArr[min+1]))")
    }
    else {
        print("최소한 두개여야 거리를 구할 수 있습니다")
    }
    
}

var inputArr:Array = [1,3,4,8,13,17,20]

solution(inputArr: inputArr)
