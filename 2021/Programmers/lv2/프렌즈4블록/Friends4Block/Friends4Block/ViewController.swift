//
//  ViewController.swift
//  Friends4Block
//
//  Created by hanwe on 2021/07/14.
//

import Cocoa

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1: \(solution(4, 5, ["CCBDE", "AAADE", "AAABF", "CCBBF"]))") // 14
        print("1: \(solution(6, 6, ["TTTANT", "RRFACC", "RRRFCC", "TRRRAA", "TTMMMF", "TMMTTJ"]))") // 15
    }
    
    func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
        var removed: Int = 0
            
        var copyBoard: [[Character]] = []
        for i in 0..<board.count {
            copyBoard.append(Array(board[i]))
        }
        while true {
            let newRemovedCnt = removeBlock(n, m, board: &copyBoard)
            if newRemovedCnt == 0 {
                break
            } else {
                removed += newRemovedCnt
                moveBlock(n, m, board: &copyBoard)
            }
        }
        
        return removed
    }
    
    struct Point {
        var x: Int
        var y: Int
    }
    
    func moveBlock(_ m: Int, _ n: Int, board: inout [[Character]]) {
        for x in (0...m-1).reversed() {
            for y in (1...n-1).reversed() {
                let currentCheckedPoint: Point = Point(x: x, y: y)
                let currentChar = board[currentCheckedPoint.y][currentCheckedPoint.x]
                if currentChar == "-" {
                    var newY = currentCheckedPoint.y
                    while true {
                        newY -= 1
                        if newY == -1 {
                            break
                        }
                        let currentChar = board[newY][currentCheckedPoint.x]
                        if currentChar != "-" {
                            board[currentCheckedPoint.y][currentCheckedPoint.x] = board[newY][currentCheckedPoint.x]
                            board[newY][currentCheckedPoint.x] = "-"
                            break
                        }
                    }
                }
            }
        }
    }
    
    func removeBlock(_ m: Int, _ n: Int, board: inout [[Character]]) -> Int {
        var removed: Int = 0
        var removedPoints: [Point] = []
        for x in 0..<m-1 {
            for y in 0..<n-1 {
                let currentCheckedPoint: Point = Point(x: x, y: y)
                let currentChar = board[currentCheckedPoint.y][currentCheckedPoint.x]
                if currentChar == "-" {
                    continue
                }
                let checked1 = board[currentCheckedPoint.y+1][currentCheckedPoint.x+1]
                let checked2 = board[currentCheckedPoint.y][currentCheckedPoint.x+1]
                let checked3 = board[currentCheckedPoint.y+1][currentCheckedPoint.x]
                if currentChar == checked1 && currentChar == checked2 && currentChar == checked3 {
                    removedPoints.append(currentCheckedPoint)
                }
            }
        }
        for item in removedPoints {
            if board[item.y][item.x] != "-" {
                board[item.y][item.x] = "-"
                removed += 1
            }
            if board[item.y+1][item.x] != "-" {
                board[item.y+1][item.x] = "-"
                removed += 1
            }
            if board[item.y][item.x+1] != "-" {
                board[item.y][item.x+1] = "-"
                removed += 1
            }
            if board[item.y+1][item.x+1] != "-" {
                board[item.y+1][item.x+1] = "-"
                removed += 1
            }
        }
        return removed
    }


}

