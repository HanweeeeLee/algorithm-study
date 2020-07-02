
/*
 
 You are going to build a stone wall. The wall should be straight and N meters long, and its thickness should be constant; however, it should have different heights in different places. The height of the wall is specified by an array H of N positive integers. H[I] is the height of the wall from I to I+1 meters to the right of its left end. In particular, H[0] is the height of the wall's left end and H[N−1] is the height of the wall's right end.

 The wall should be built of cuboid stone blocks (that is, all sides of such blocks are rectangular). Your task is to compute the minimum number of blocks needed to build the wall.

 Write a function:

 public func solution(_ H : inout [Int]) -> Int

 that, given an array H of N positive integers specifying the height of the wall, returns the minimum number of blocks needed to build it.

 For example, given array H containing N = 9 integers:

   H[0] = 8    H[1] = 8    H[2] = 5
   H[3] = 7    H[4] = 9    H[5] = 8
   H[6] = 7    H[7] = 4    H[8] = 8
 the function should return 7. The figure shows one possible arrangement of seven blocks.



 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [1..100,000];
 each element of array H is an integer within the range [1..1,000,000,000].
 Copyright 2009–2020 by Codility Limited. All Rights Reserved. Unauthorized copying, publication or disclosure prohibited.
 
 */


import UIKit

var str = "Hello, playground"

public func solution(_ H : inout [Int]) -> Int { //O(N)
    var totalCnt:Int = 0
    var stack:Array = Array<Int>()
    
    if H.count > 0 {
        stack.append(H[0])
        totalCnt += 1
    }
    
    for i in 1..<H.count {
        if stack.count > 0 { // 스텍에 뭔가 있다
            if stack.last! > H[i] { //stack.last > H[i]
                while true {
                    if stack.count > 0 {
                        if stack.last! > H[i] {
                            stack.removeLast()
                            totalCnt += 1
                            continue
                        }
                        else if stack.last! == H[i] { // 같으면 지워주기만한다(while문 밖에서 어짜피 append됨)
                            stack.removeLast()
                            break
                        }
                        else {
                            break
                        }
                    }
                    else {
                        break
                    }
                }
                stack.append(H[i])
                
            }
            else if stack.last! == H[i] { //stack.last == H[i]
                continue
            }
            else { // stack.last < H[i]
                stack.append(H[i])
            }
        }
        else { // 빈 스텍
            //이런 일이 일어날 수 있을까?
//            print("?")
        }
    }
    totalCnt += (stack.count - 1)
    
    return totalCnt
}

var input:Array = [8,8,5,7,9,8,7,4,8]
print("result:\(solution(&input))")
