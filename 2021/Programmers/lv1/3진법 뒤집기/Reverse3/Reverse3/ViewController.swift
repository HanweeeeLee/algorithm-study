//
//  ViewController.swift
//  Reverse3
//
//  Created by hanwe on 2021/07/03.
//

import Cocoa

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1: \(solution(45))") // 7
        print("2: \(solution(125))") // 229
    }
    
    func solution(_ n:Int) -> Int {
        let bin3: String = convert10to3(n)
        let reverse = String(bin3.reversed())
        return convert3to10(reverse)
    }
    
    func convert3to10(_ inputed: String) -> Int {
        return Int(inputed, radix: 3)!
    }

    func convert10to3(_ inputed: Int) -> String {
        return String(inputed, radix: 3)
    }


}

