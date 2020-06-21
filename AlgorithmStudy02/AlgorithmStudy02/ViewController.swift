//
//  ViewController.swift
//  AlgorithmStudy02
//
//  Created by hanwe on 2020/06/21.
//  Copyright © 2020 hanwe. All rights reserved.
//

/*
 
 코딩도장
 http://codingdojang.com/scode/266?answer_mode=hide

 문제는 다음과 같다:

 6 6

   0   1   2   3   4   5
  19  20  21  22  23   6
  18  31  32  33  24   7
  17  30  35  34  25   8
  16  29  28  27  26   9
  15  14  13  12  11  10
 위처럼 6 6이라는 입력을 주면 6 X 6 매트릭스에 나선형 회전을 한 값을 출력해야 한다.
 
 6 4
 0  1   2   3   4   5
 15 16  17  18  19  6
 14 23  22  21  20  7
 13 12  11  10  9   8
 
 
 3 6
 0  1   2
 13 14  3
 12 15  4
 11 16  5
 10 17  6
 9  8   7
 
 2 6
 0  1
 11 2
 10 3
 9  4
 8  5
 7  6
 */

import UIKit

enum widthDirectionFlag {
    case left
    case right
}

enum heightDirectionFlag {
    case up
    case down
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        matrix(width: 3, height: 6)
    }
    
    func matrix(width:Int,height:Int) {
        var matrixDic:Dictionary = [Int:Int]()
        var widthCnt:Int = width
        var heightCnt:Int = height - 1
        var currentNum:Int = 0
        var currentMatrixIndex:Int = -1
        var widthDrectionFlag:widthDirectionFlag = .left
        var heightDirectionFlag:heightDirectionFlag = .up
        while true {
            if widthCnt != 0 {
                for _ in 0..<widthCnt {
                    switch widthDrectionFlag {
                    case .left:
                        matrixDic[currentMatrixIndex+1] = currentNum
                        currentMatrixIndex += 1
                        currentNum += 1
                        break
                    case .right:
                        matrixDic[currentMatrixIndex-1] = currentNum
                        currentMatrixIndex -= 1
                        currentNum += 1
                        break
                    }
                }
                if heightCnt != 0 {
                    widthCnt -= 1
                }
                else {
                    break
                }
                if widthDrectionFlag == .left {
                    widthDrectionFlag = .right
                }
                else {
                    widthDrectionFlag = .left
                }
            }
            
            if heightCnt != 0 {
                for _ in 0..<heightCnt {
                    switch heightDirectionFlag {
                    case .up:
                        matrixDic[currentMatrixIndex + width] = currentNum
                        currentMatrixIndex += width
                        currentNum += 1
                        break
                    case .down:
                        matrixDic[currentMatrixIndex - width] = currentNum
                        currentMatrixIndex -= width
                        currentNum += 1
                        break
                    }
                }
                if widthCnt != 0 {
                    heightCnt -= 1
                }
                else {
                    break
                }
                if heightDirectionFlag == .up {
                    heightDirectionFlag = .down
                }
                else {
                    heightDirectionFlag = .up
                }
            }
            
            if heightCnt == 0 && widthCnt == 0 {
                break
            }
        }
        let keyArr = matrixDic.keys.sorted(by: { $0 < $1})
        print("keyArr:\(keyArr)")
        for i in 0..<keyArr.count {
            print("\(String(describing: matrixDic[keyArr[i]]))")
        }
    }


}

