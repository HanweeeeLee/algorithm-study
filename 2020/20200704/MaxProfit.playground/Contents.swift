/*
 
 An array A consisting of N integers is given. It contains daily prices of a stock share for a period of N consecutive days. If a single share was bought on day P and sold on day Q, where 0 ≤ P ≤ Q < N, then the profit of such transaction is equal to A[Q] − A[P], provided that A[Q] ≥ A[P]. Otherwise, the transaction brings loss of A[P] − A[Q].

 For example, consider the following array A consisting of six elements such that:

   A[0] = 23171
   A[1] = 21011
   A[2] = 21123
   A[3] = 21366
   A[4] = 21013
   A[5] = 21367
 If a share was bought on day 0 and sold on day 2, a loss of 2048 would occur because A[2] − A[0] = 21123 − 23171 = −2048. If a share was bought on day 4 and sold on day 5, a profit of 354 would occur because A[5] − A[4] = 21367 − 21013 = 354. Maximum possible profit was 356. It would occur if a share was bought on day 1 and sold on day 5.

 Write a function,

 public func solution(_ A : inout [Int]) -> Int

 that, given an array A consisting of N integers containing daily prices of a stock share for a period of N consecutive days, returns the maximum possible profit from one transaction during this period. The function should return 0 if it was impossible to gain any profit.

 For example, given array A consisting of six elements such that:

   A[0] = 23171
   A[1] = 21011
   A[2] = 21123
   A[3] = 21366
   A[4] = 21013
   A[5] = 21367
 the function should return 356, as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [0..400,000];
 each element of array A is an integer within the range [0..200,000].
 Copyright 2009–2020 by Codility Limited. All Rights Reserved. Unauthorized copying, publication or disclosure prohibited.
 
 */


import UIKit

var str = "Hello, playground"

//public func solution(_ A : inout [Int]) -> Int { //O(N**2)
//    var maxProfit:Int = 0
//    if A.count >= 2 {// 최소한 이틀은 있어야... 손익분기점이 나온다
//        var buyDateIndex:Int = 0 //현재 구매날짜
//        var saleDateIndex:Int = 1 //현재 판매날짜
//        maxProfit = A[saleDateIndex] - A[buyDateIndex]  // 디폴트로 가져간다.
//        for i in 1..<A.count {
//            for j in i+1..<A.count {
//                if A[j] - A[i] > maxProfit {
//                    maxProfit = A[j] - A[i]
//                    buyDateIndex = i
//                    saleDateIndex = j
//                }
//            }
//        }
//        print("산날 :\(buyDateIndex) 판날:\(saleDateIndex) 손익:\(maxProfit)")
//    }
//    if 0 > maxProfit {
//        maxProfit = 0
//    }
//    return maxProfit
//}

public func solution(_ A : inout [Int]) -> Int { //모르겠습니다..................
    var maxProfit:Int = 0
    if A.count >= 2 {// 최소한 이틀은 있어야... 손익분기점이 나온다
        var buyDateIndex:Int = 0 //현재 구매날짜
        var saleDateIndex:Int = 1 //현재 판매날짜
        maxProfit = A[saleDateIndex] - A[buyDateIndex]  // 디폴트로 가져간다.
        
        for i in 2..<A.count {
            
        }
        
        print("산날 :\(buyDateIndex) 판날:\(saleDateIndex) 손익:\(maxProfit)")
    }
    if 0 > maxProfit {
        maxProfit = 0
    }
    return maxProfit
}

var inputArr = [23171,21011,21123,21366,21013,21367]
//var inputArr = [5,4,3,2,1]

print("result:\(solution(&inputArr))")

