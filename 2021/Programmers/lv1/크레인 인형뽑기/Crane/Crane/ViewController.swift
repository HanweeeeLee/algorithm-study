//
//  ViewController.swift
//  Crane
//
//  Created by hanwe lee on 2021/07/05.
//

import Cocoa
//https://programmers.co.kr/learn/courses/30/lessons/64061/solution_groups?language=swift

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("1:\(solution([[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]], [1,5,3,5,1,2,1,4]))") // 4
    }
    
    func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
        var removedCnt: Int = 0
        var stack: [Int] = []
        var copyBoard = board
        
        for i in 0..<moves.count {
            let picked = searchAndPick(board: &copyBoard, pickPoint: moves[i])
            if picked == 0 {
                continue
            }
            if checkStackRemove(inputed: &stack, appended: picked) {
                removedCnt += 2
            } else {
                stack.append(picked)
            }
        }
        
        return removedCnt
    }
    
    func searchAndPick(board: inout [[Int]], pickPoint: Int) -> Int {
        var returnValue: Int = 0
        
        for i in 0..<board.count {
            if board[i][pickPoint-1] != 0 {
                returnValue = board[i][pickPoint-1]
                board[i][pickPoint-1] = 0
                break
            }
        }
        
        return returnValue
    }
    
    func checkStackRemove(inputed: inout [Int], appended: Int) -> Bool {
        var returnValue: Bool = false
        if inputed.count > 0 {
            if inputed.last! == appended {
                inputed.removeLast()
                returnValue = true
            }
        }
        return returnValue
    }


}

