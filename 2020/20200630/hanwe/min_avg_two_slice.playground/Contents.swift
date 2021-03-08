/*
 
 min_avg_two_slice

 https://app.codility.com/programmers/lessons/5-prefix_sums/min_avg_two_slice/start/

 A non-empty array A consisting of N integers is given. A pair of integers (P, Q), such that 0 ≤ P < Q < N, is called a slice of array A (notice that the slice contains at least two elements). The average of a slice (P, Q) is the sum of A[P] + A[P + 1] + ... + A[Q] divided by the length of the slice. To be precise, the average equals (A[P] + A[P + 1] + ... + A[Q]) / (Q − P + 1).

 For example, array A such that:

     A[0] = 4
     A[1] = 2
     A[2] = 2
     A[3] = 5
     A[4] = 1
     A[5] = 5
     A[6] = 8
 contains the following example slices:

 slice (1, 2), whose average is (2 + 2) / 2 = 2;
 slice (3, 4), whose average is (5 + 1) / 2 = 3;
 slice (1, 4), whose average is (2 + 2 + 5 + 1) / 4 = 2.5.
 The goal is to find the starting position of a slice whose average is minimal.

 Write a function:

 public func solution(_ A : inout [Int]) -> Int

 that, given a non-empty array A consisting of N integers, returns the starting position of the slice with the minimal average. If there is more than one slice with a minimal average, you should return the smallest starting position of such a slice.

 For example, given array A such that:

     A[0] = 4
     A[1] = 2
     A[2] = 2
     A[3] = 5
     A[4] = 1
     A[5] = 5
     A[6] = 8
 the function should return 1, as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [2..100,000];
 each element of array A is an integer within the range [−10,000..10,000].
 Copyright 2009–2020 by Codility Limited. All Rights Reserved. Unauthorized copying, publication or disclosure prohibited.
 
 */

import UIKit

var str = "Hello, playground"

struct MyMin {
    var minAvr:Float
    var startIndex:Int
}

//public func solution(_ A : inout [Int]) -> Int { //O(N ** 2)
//    var min:MyMin = MyMin(minAvr: 0.0, startIndex: 0)
//    min.minAvr = (Float(A[0]) + Float(A[1]))/2
//    min.startIndex = 0
//    print("minAvr:\(min.minAvr)")
//
//    for i in 0..<A.count {
//        let startIndex:Int = i
//        for j in startIndex..<A.count {
//            let endIndex:Int = j
//            var sum:Int = 0
//            if startIndex != endIndex {
//                for k in startIndex...endIndex {
//                    sum += A[k]
//                }
//                print("startIndex:\(startIndex) endIndex:\(endIndex)")
//                print("비교 :\(Float(sum)/Float((endIndex - startIndex + 1)))")
//                if min.minAvr > Float(sum)/Float((endIndex - startIndex + 1)) {
//                    min.minAvr = Float(sum)/Float((endIndex - startIndex + 1))
//                    min.startIndex = startIndex
//                    print("min change :\(min.minAvr) \(min.startIndex)")
//                }
//            }
//        }
//    }
//
//    return min.startIndex
//}

public func solution(_ A : inout [Int]) -> Int { //O(N)
    var min:MyMin = MyMin(minAvr: 0.0, startIndex: 0)
    min.minAvr = (Float(A[0]) + Float(A[1]))/2
    min.startIndex = 0
    print("minAvr:\(min.minAvr)")
    
    for i in 0..<A.count - 2 {
        let twoAvr:Float = (Float(A[i]) + Float(A[i+1]))/2
        if min.minAvr > twoAvr {
            min.minAvr = twoAvr
            min.startIndex = i
        }
        
        let threeAvr:Float = (Float(A[i]) + Float(A[i+1]) + Float(A[i+2]))/3
        if min.minAvr > threeAvr {
            min.minAvr = threeAvr
            min.startIndex = i
        }
    }
    
    return min.startIndex
}

var myArr:Array = [4,2,2,5,1,5,8]

print("result :\(solution(&myArr))")

