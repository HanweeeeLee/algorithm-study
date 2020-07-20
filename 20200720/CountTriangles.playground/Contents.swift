/*
 An array A consisting of N integers is given. A triplet (P, Q, R) is triangular if it is possible to build a triangle with sides of lengths A[P], A[Q] and A[R]. In other words, triplet (P, Q, R) is triangular if 0 ≤ P < Q < R < N and:

 A[P] + A[Q] > A[R],
 A[Q] + A[R] > A[P],
 A[R] + A[P] > A[Q].
 For example, consider array A such that:

   A[0] = 10    A[1] = 2    A[2] = 5
   A[3] = 1     A[4] = 8    A[5] = 12
 There are four triangular triplets that can be constructed from elements of this array, namely (0, 2, 4), (0, 2, 5), (0, 4, 5), and (2, 4, 5).

 Write a function:

 public func solution(_ A : inout [Int]) -> Int

 that, given an array A consisting of N integers, returns the number of triangular triplets in this array.

 For example, given array A such that:

   A[0] = 10    A[1] = 2    A[2] = 5
   A[3] = 1     A[4] = 8    A[5] = 12
 the function should return 4, as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [0..1,000];
 each element of array A is an integer within the range [1..1,000,000,000].
 Copyright 2009–2020 by Codility Limited. All Rights Reserved. Unauthorized copying, publication or disclosure prohibited.
 */


import UIKit

var str = "Hello, playground"

public func solution(_ A : inout [Int]) -> Int {
    var cnt:Int = 0
    let sortedA = A.sorted()
    if A.count > 2 {
        for i in 0..<sortedA.count-2 {
            for j in i+1..<sortedA.count-1 {
                for k in j+1..<sortedA.count {
                    if isTriangle(P: sortedA[i], Q: sortedA[j], R: sortedA[k], N: A.count) {
                        cnt += 1
                    }
                }
            }
        }
    }
    
    return cnt
}

func isTriangle(P:Int,Q:Int,R:Int,N:Int) -> Bool {
    var isTriangle:Bool = false
    if P + Q > R && Q + R > P && R + P > Q {
        isTriangle = true
    }
    
    return isTriangle
}

var result = [10,2,5,1,8,12]
print("result:\(solution(&result))")
