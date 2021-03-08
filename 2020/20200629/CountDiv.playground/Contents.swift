
/*
 
 count_div
 https://app.codility.com/programmers/lessons/5-prefix_sums/count_div/start/

 Write a function:

 public func solution(_ A : Int, _ B : Int, _ K : Int) -> Int

 that, given three integers A, B and K, returns the number of integers within the range [A..B] that are divisible by K, i.e.:

 { i : A ≤ i ≤ B, i mod K = 0 }

 For example, for A = 6, B = 11 and K = 2, your function should return 3, because there are three numbers divisible by 2 within the range [6..11], namely 6, 8 and 10.

 Write an efficient algorithm for the following assumptions:

 A and B are integers within the range [0..2,000,000,000];
 K is an integer within the range [1..2,000,000,000];
 A ≤ B.
 Copyright 2009–2020 by Codility Limited. All Rights Reserved. Unauthorized copying, publication or disclosure prohibited.
 
 
 */




import UIKit

var str = "Hello, playground"

//public func solution(_ A : Int, _ B : Int, _ K : Int) -> Int { //O(B-A)
//    var returnInt:Int = 0
//    for i in A...B {
//        if i%K == 0 {
//            returnInt += 1
//        }
//    }
//    return returnInt
//}

//public func solution(_ A : Int, _ B : Int, _ K : Int) -> Int { //O((B-A)/K)
//    var returnInt:Int = 0
//
//    var currentValue:Int = A
//    for i in A...B {
////        print("i :\(i)")
//        if i%K == 0 {
//            currentValue = i
//            returnInt += 1
//            break
//        }
//    }
////    print("currentValue:\(currentValue)")
//
//    while true {
//        currentValue += K
//        if currentValue > B {
//            break
//        }
//        else {
//            returnInt += 1
//        }
//    }
//
//    return returnInt
//}

public func solution(_ A : Int, _ B : Int, _ K : Int) -> Int { //O(1)
    var returnInt:Int = 0
    
    var currentValue:Int = A
    for i in A...B {
        if i%K == 0 {
            currentValue = i
            returnInt += 1
            break
        }
    }
    returnInt = ((B - currentValue)/K) + returnInt
    
    
    return returnInt
}
print("result:\(solution(6, 11, 2))")
