/*
 
 An array A consisting of N integers is given. The dominator of array A is the value that occurs in more than half of the elements of A.

 For example, consider array A such that

  A[0] = 3    A[1] = 4    A[2] =  3
  A[3] = 2    A[4] = 3    A[5] = -1
  A[6] = 3    A[7] = 3
 The dominator of A is 3 because it occurs in 5 out of 8 elements of A (namely in those with indices 0, 2, 4, 6 and 7) and 5 is more than a half of 8.

 Write a function

 public func solution(_ A : inout [Int]) -> Int

 that, given an array A consisting of N integers, returns index of any element of array A in which the dominator of A occurs. The function should return −1 if array A does not have a dominator.

 For example, given array A such that

  A[0] = 3    A[1] = 4    A[2] =  3
  A[3] = 2    A[4] = 3    A[5] = -1
  A[6] = 3    A[7] = 3
 the function may return 0, 2, 4, 6 or 7, as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [0..100,000];
 each element of array A is an integer within the range [−2,147,483,648..2,147,483,647].
 Copyright 2009–2020 by Codility Limited. All Rights Reserved. Unauthorized copying, publication or disclosure prohibited.
 
 */

import UIKit

var str = "Hello, playground"

struct maxStruct {
    var index:Int
    var cnt:Int
    var value:Int?
}


public func solution(_ A : inout [Int]) -> Int { // 문제를 잘못 이해했나 아무리 읽어봐도 가장많은수의 인덱스를 리턴하는것인데.. 자꾸 틀렸다고 나옴.......................................... 가장 많으면서, 앞의 인덱스를 리턴하는건가?
    var cntDic:Dictionary = [Int:Int]()
    var max:maxStruct = maxStruct(index: -1, cnt: 0, value: nil)
    for i in 0..<A.count {
        if cntDic[A[i]] == nil {
            cntDic[A[i]] = 1
        }
        else {
            cntDic[A[i]]! += 1
        }
        
        if cntDic[A[i]]! > max.cnt { //변경
            max.cnt = cntDic[A[i]]!
            max.index = i
            max.value = A[i]
        }
        else if cntDic[A[i]]! == max.cnt { //동률
            if max.value != nil { //max.value nil체크
                if max.value! == A[i] { // max.value와 비교대상이 같음
                    //아무것도 하지않는다.
                }
                else { // max.value와 비교대상이 같지않음
                    max.index = -1 // dominator가 없기때문에 index를 -1로 (동률이라)
                }
            }
            else { //max.value == nil
                max.cnt = cntDic[A[i]]!
                max.index = i
                max.value = A[i]
            }
        }
    }
    
    return max.index
}

//var inputArr:Array = [3,4,3,2,3,-1,3,3]
var inputArr:Array = [2,1,1,3]

print("result:\(solution(&inputArr))")

