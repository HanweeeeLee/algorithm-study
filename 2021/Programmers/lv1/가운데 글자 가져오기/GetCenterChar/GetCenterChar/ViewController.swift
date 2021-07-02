//
//  ViewController.swift
//  GetCenterChar
//
//  Created by hanwe on 2021/07/02.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("1:\(solution("abcde"))") // c
        print("2:\(solution("qwer"))") // we
        print("3:\(solution("qwertyuio"))") // t
    }
    
    func solution(_ s: String) -> String {
        var returnValue: String = ""
        let sArr = Array(s)
        if s.count % 2 == 0 { // 짝수개
            returnValue = String(sArr[s.count/2-1]) + String(sArr[s.count/2])
        } else { // 홀수개
            returnValue = String(sArr[s.count/2])
        }
        return returnValue
    }

}

