//
//  ViewController.swift
//  programmers_lv1
//
//  Created by hanwe on 2021/03/08.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("result:\(solution("abcde") /*c*/)")
        print("result:\(solution("qwer") /*we*/)")
        
    }
    
    func solution(_ s:String) -> String {
        var returnStr: String = ""
        if s.count%2 == 1{
            let startIndex: Int = s.count/2
            let endIndex: Int = s.count/2
            returnStr = cutString(originString: s, fromIndex: startIndex, toIndex: endIndex)
        }
        else {
            let startIndex: Int = s.count/2 - 1
            let endIndex: Int = s.count/2
            returnStr = cutString(originString: s, fromIndex: startIndex, toIndex: endIndex)
        }
        
        return returnStr
    }
    
    func cutString(originString: String, fromIndex: Int, toIndex: Int) -> String {
        let firstIndex = originString.index(originString.startIndex, offsetBy: fromIndex)
        let lastIndex = originString.index(originString.startIndex, offsetBy: toIndex)
        return String(originString[firstIndex...lastIndex])
    }

}

