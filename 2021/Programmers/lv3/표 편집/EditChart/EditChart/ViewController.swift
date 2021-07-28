//
//  ViewController.swift
//  EditChart
//
//  Created by hanwe lee on 2021/07/28.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("1: \(solution(8, 2, ["D 2","C","U 3","C","D 4","C","U 2","Z","Z"]))") // "OOOOXOOO"
        print("2: \(solution(8, 2, ["D 2","C","U 3","C","D 4","C","U 2","Z","Z","U 1","C"]))") // "OOXOXOOO"
    }
    
    func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
        var currentIndex: Int = k
        var deleteStack: [DeletedElement] = []
        var currentChart: [Int] = [Int](0...n-1)
        
        for command in cmd {
            let splitedCmd = command.split(separator: " ")
            if splitedCmd.count == 1 {
                switch splitedCmd[0] {
                case "C":
                    deleteStack.append(DeletedElement(index: currentIndex, value: currentChart[currentIndex]))
                    currentChart.remove(at: currentIndex)
                    if currentChart.count == currentIndex {
                        currentIndex -= 1
                    }
                case "Z":
                    currentChart.insert(deleteStack.last!.value, at: deleteStack.last!.index)
                    if currentIndex >= deleteStack.last!.index {
                        currentIndex += 1
                    }
                    deleteStack.removeLast()
                default:
                    break
                }
            } else {
                let cmdValue: Int = Int(splitedCmd[1])!
                switch splitedCmd[0] {
                case "D":
                    currentIndex += cmdValue
                case "U":
                    currentIndex -= cmdValue
                default:
                    break
                }
            }
        }
        
        var resultStr: String = ""
        
        var item: Int = 0
        while true {
            if currentChart.count == 0 {
                break
            }
            let first = currentChart.first!
            if first == item {
                resultStr.append("O")
                currentChart.removeFirst()
            } else {
                resultStr.append("X")
            }
            item += 1
        }
        return resultStr
    }
    
    struct DeletedElement {
        var index: Int
        var value: Int
    }

}

