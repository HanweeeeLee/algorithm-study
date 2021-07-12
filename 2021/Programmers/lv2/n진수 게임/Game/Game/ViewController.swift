//
//  ViewController.swift
//  Game
//
//  Created by hanwe on 2021/07/12.
//

import Cocoa

class ViewController: NSViewController {
    
//    진법 n, 미리 구할 숫자의 갯수 t, 게임에 참가하는 인원 m, 튜브의 순서 p 가 주어진다.
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1: \(solution(2, 4, 2, 1))") // 0111
        print("2: \(solution(16, 16, 2, 1))") // "02468ACE11111111"
        print("3: \(solution(16, 16, 2, 2))") // "13579BDF01234567"
    }
    
    func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
        
        var currentIndex: Int = 0
        var currentNumber: Int = 0
        var myChars: [Character] = []
        var currentNumberStack: String = "0"
        let rest = p == m ? 0 : p
        while true {
            if currentNumberStack == "" {
                currentNumber += 1
                currentNumberStack = String(currentNumber, radix: n)
            }
            if currentNumberStack.count > 0 {
                let called = currentNumberStack.first!
                currentNumberStack.removeFirst()
                if (currentIndex + 1) % m == rest /*|| (currentIndex + 1) % m == 0 */{ // 내차례
                    myChars.append(called)
                }
            } else {
                currentNumberStack = "" //필요 없는 코드긴 할듯
            }
            
            if myChars.count == t {
                break
            }
            currentIndex += 1
        }
        
        var result: String = ""
        for item in myChars {
            result.append(item)
        }
        
        return result.uppercased()
    }


}

