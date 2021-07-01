//
//  ViewController.swift
//  20210329_lv1
//
//  Created by hanwe on 2021/03/29.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func solution(_ n:Int) -> String {
        var returnStr: String = ""
        for i in 0..<n {
            if i%2 == 0 {
                returnStr = returnStr + "수"
            }
            else {
                returnStr = returnStr + "박"
            }
        }
        return returnStr
    }

}

