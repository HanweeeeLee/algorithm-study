//
//  ViewController.swift
//  MakeDistance
//
//  Created by hanwe lee on 2021/07/08.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        print("1: \(solution([["POOOP", "OXXOX", "OPXPX", "OOXOX", "POXXP"], ["POOPX", "OXPXP", "PXXXO", "OXXXO", "OOOPP"], ["PXOPX", "OXOXP", "OXPOX", "OXXOP", "PXPOX"], ["OOOXX", "XOOOX", "OOOXX", "OXOOX", "OOOOO"], ["PXPXP", "XPXPX", "PXPXP", "XPXPX", "PXPXP"]]))") // [1, 0, 1, 1, 1]
//        print("2: \(solution([["OOOOO", "OOOOO", "OOOOO", "OOOOO", "PXPOP"]]))")
//        print("3: \(solution([["POOOP", "OXXOX", "OPXPX", "OOXOX", "POXXP"]]))")
//        print("4: \(solution([["PXPXP", "XPXPX", "PXPXP", "XPXPX", "PXPXP"]]))") // 1
//        print("5: \(solution([["OOOOO", "OOOOO", "OOPOO", "OOOOO", "OOOOO"]]))")
//        print("6: \(solution([["PXXXX", "OXXXX", "XPXXX", "XXXXX", "XXXXX"]]))")
    }
    
//    두 테이블 T1, T2가 행렬 (r1, c1), (r2, c2)에 각각 위치하고 있다면, T1, T2 사이의 맨해튼 거리는 |r1 - r2| + |c1 - c2| 입니다. ↩
//    2 이하로 앉지 말아 주세요.
    func solution(_ places:[[String]]) -> [Int] {
        var returnValue: [Int] = []
        for item in places {
            let result = checkRoom(item) ? 1 : 0
            returnValue.append(result)
        }
        return returnValue
    }
    
    struct Point {
        let x: Int
        let y: Int
    }
    
    func checkRoom(_ room: [String]) -> Bool { // false면 안지킨다
        let returnValue: Bool = true
        var copyRoom: [String] = room
        
        for i in 0..<copyRoom.count {
            let line = copyRoom[i]
            for j in 0..<line.count {
                let itemPoint: Point = Point(x: i, y: j)
                let itemState: Character = Array(copyRoom[i])[j]
                if itemState == "P" {
                    if checkDistance(copyRoom, myPoint: itemPoint) {
                        var newLine = copyRoom[i]
                        let replaceIndex = newLine.index(newLine.startIndex, offsetBy: j)
                        newLine.remove(at: replaceIndex)
                        newLine.insert("C", at: replaceIndex)
                        copyRoom[i] = newLine
                    } else {
                        return false
                    }
                }
            }
        }
        
        return returnValue
    }
    
    func checkDistance(_ room: [String], myPoint: Point) -> Bool { // false면 안지킨다.
        let result: Bool = true
//        print("myPoint: \(myPoint.x).\(myPoint.y)")
        var xLoop = myPoint.x
        if xLoop != 0 {
            xLoop -= 1
        }
        var yLoop = myPoint.y
        if yLoop != 0 {
            yLoop -= 1
        }
        for i in xLoop..<5 {
            for j in yLoop..<5 {
                if myPoint.x == i && myPoint.y == j {
                    continue
                }
//                print("willChecked: \(i).\(j)")
                if getManDistance(myPoint: myPoint, yourPoint: Point(x: i, y: j)) <= 2 {
                    let checkedState: Character = Array(room[i])[j]
                    if checkedState == "P" {
                        if !isExistPart(room: room, myPoint: myPoint, yourPoint: Point(x: i, y: j)) {
                            return false
                        }
                    }
                } else {
                    continue
                }
            }
        }
//        print("-----")
        return result
    }
    
    func getManDistance(myPoint: Point, yourPoint: Point) -> Int {
        var resultValue: Int = 0
        let value1: Int = abs((myPoint.x - yourPoint.x))
        let value2: Int = abs((myPoint.y - yourPoint.y))
        resultValue = value1 + value2
        return resultValue
    }
    
    func isExistPart(room: [String], myPoint: Point, yourPoint: Point) -> Bool {
        let result: Bool = false
        if myPoint.x == yourPoint.x {
            for i in myPoint.y+1..<yourPoint.y {
                let checkedState: Character = Array(room[myPoint.x])[i]
                if checkedState == "X" {
                    return true
                }
            }
        } else if myPoint.y == yourPoint.y {
            for i in myPoint.x+1..<yourPoint.x {
                let checkedState: Character = Array(room[i])[myPoint.y]
                if checkedState == "X" {
                    return true
                }
            }
        } else {
            
            
            var checkedState1: Character = Character("_")
            var checkedState2: Character = Character("_")

            if yourPoint.x < myPoint.x {
                checkedState1 = Array(room[myPoint.x - 1])[myPoint.y]
                checkedState2 = Array(room[myPoint.x])[myPoint.y + 1]
            } else if yourPoint.y < myPoint.y {
                checkedState1 = Array(room[myPoint.x + 1])[myPoint.y]
                checkedState2 = Array(room[myPoint.x])[myPoint.y - 1]
            } else {
                checkedState1 = Array(room[myPoint.x + 1])[myPoint.y]
                checkedState2 = Array(room[myPoint.x])[myPoint.y + 1]
            }
            if (checkedState1 == "X" && checkedState2 == "X") {
                return true
            } else {
                return false
            }
            
            
        }
        return result
    }
    


}

