//
//  ViewController.swift
//  WordChainInEng
//
//  Created by hanwe on 2021/07/08.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        print("1: \(solution(3, ["tank", "kick", "know", "wheel", "land", "dream", "mother", "robot", "tank"]))") // [3,3]
//        print("2: \(solution(5, ["hello", "observe", "effect", "take", "either", "recognize", "encourage", "ensure", "establish", "hang", "gather", "refer", "reference", "estimate", "executive"]))") // [0,0]
//        print("1: \(solution(2, ["hello", "one", "even", "never", "now", "world", "draw"]))") // [1,3]
        print("4: \(solution(2, ["land", "dream", "mom", "mom", "ror"]))")
    }
//    사람의 수 n과 사람들이 순서대로 말한 단어 words 가 매개변수로 주어질 때, 가장 먼저 탈락하는 사람의 번호와 그 사람이 자신의 몇 번째 차례에 탈락하는지를 구해서 return 하도록 solution 함수를 완성해주세요.
    func solution(_ n: Int, _ words: [String]) -> [Int] {
        var result: [Int] = []
        
        let humanCnt: Int = n
        var wordPool: Set<String> = []
        var beforeLastChar: Character = Character("_")
        var loopCnt: Int = 1
        var currentUser: Int = 1
        var wrongFlag: Bool = false
        for item in words {
            if !(item.count >= 2 && item.count <= 50) {
                break
            }
            
            if wordPool.contains(item) { // 이미 말한 단어임
                wrongFlag = true
                break
            }
            
            if beforeLastChar == "_" { // 처음 시작
                beforeLastChar = item.last!
                currentUser += 1
                if currentUser > humanCnt {
                    currentUser = 1
                    loopCnt += 1
                }
                wordPool.insert(item)
                continue
            }
            
            if item.first! != beforeLastChar { // 틀렸음
                wrongFlag = true
                break
            }
            
            beforeLastChar = item.last!
            currentUser += 1
            wordPool.insert(item)
            if currentUser > humanCnt {
                currentUser = 1
                loopCnt += 1
            }
            
        }
        
        if !wrongFlag {
            result.removeAll()
            result.append(0)
            result.append(0)
        } else {
            result.append(currentUser)
            result.append(loopCnt)
        }
        
        return result
    }


}

