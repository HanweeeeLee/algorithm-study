//
//  ViewController.swift
//  PressKeyPad
//
//  Created by hanwe on 2021/07/01.
//

import UIKit
//https://programmers.co.kr/learn/courses/30/lessons/67256?language=swift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //1, 4, 7 -> L
        //3, 6, 9 -> R
        print("1:\(solution([1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5], "right"))") // "LRLLLRLLRRL"
        print("2:\(solution([7, 0, 8, 2, 8, 3, 1, 5, 7, 6, 2], "left"))") // "LRLLRRLLLRR"
        print("3:\(solution([1, 2, 3, 4, 5, 6, 7, 8, 9, 0], "right"))") // "LLRLLRLLRL"
    }
    
    var myHand: String = ""
    func getHand(number: Int, currentLeft: Int, currentRight: Int) -> String {
        if number == currentRight {
            return "R"
        }
        if number == currentLeft {
            return "L"
        }
        if currentLeft == currentRight {
            return myHand
        }
        
        var returnValue: String = ""
        
        let left = getJumpCount(number: number, currentPoint: currentLeft)
        let right = getJumpCount(number: number, currentPoint: currentRight)
        if left > right {
            returnValue = "R"
        } else if right > left {
            returnValue = "L"
        } else {
            returnValue = myHand
        }
        
        
        return returnValue
    }
    
    func getJumpCount(number: Int, currentPoint: Int) -> Int {
        var returnValue: Int = 0
        switch number {
        case 2:
            switch currentPoint {
            case 1,3,5:
                returnValue = 1
            case 4,6,8:
                returnValue = 2
            case 7,9,0:
                returnValue = 3
            case -1:
                returnValue = 4
            default:
                fatalError()
            }
        case 5:
            switch currentPoint {
            case 2,4,6,8:
                returnValue = 1
            case 1,3,7,9,0:
                returnValue = 2
            case -1:
                returnValue = 3
            default:
                fatalError()
            }
        case 8:
            switch currentPoint {
            case 5,7,9,0:
                returnValue = 1
            case 6,4,2,-1:
                returnValue = 2
            case 1,3:
                returnValue = 3
            default:
                fatalError()
            }
        case 0:
            switch currentPoint {
            case 8, -1:
                returnValue = 1
            case 9,5,7:
                returnValue = 2
            case 4,2,6:
                returnValue = 3
            case 1,3:
                returnValue = 4
            default:
                fatalError()
            }
        default:
            fatalError()
        }
        return returnValue
    }
    
    func solution(_ numbers: [Int], _ hand: String) -> String {
        myHand = hand == "right" ? "R" : "L"
        var returnValue: String = ""
        var leftPosition: Int = -1 // 왼손 현재위치
        var rightPosition: Int = -1 // 오른손 현재위치
        
        for i in 0..<numbers.count {
            switch numbers[i] {
            case 1, 4, 7:
                returnValue += "L"
                leftPosition = numbers[i]
            case 2, 5, 8, 0:
                let result = getHand(number: numbers[i], currentLeft: leftPosition, currentRight: rightPosition)
                if result == "L" {
                    leftPosition = numbers[i]
                } else {
                    rightPosition = numbers[i]
                }
                returnValue += result
            case 3, 6, 9:
                returnValue += "R"
                rightPosition = numbers[i]
            default:
                break
            }
        }
        return returnValue
    }

}

