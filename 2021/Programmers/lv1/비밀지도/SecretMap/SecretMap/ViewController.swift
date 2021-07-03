//
//  ViewController.swift
//  SecretMap
//
//  Created by hanwe on 2021/07/03.
//

import Cocoa

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1:\(solution(5, [9, 20, 28, 18, 11], [30, 1, 21, 17, 28]))") //["#####","# # #", "### #", "# ##", "#####"]
        print("2:\(solution(6, [46, 33, 33 ,22, 31, 50], [27 ,56, 19, 14, 14, 10]))") //["######", "### #", "## ##", " #### ", " #####", "### # "]
    }
    
    var size: Int = 0
    
    func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
        size = n
        var answer: [String] = []
        
        var map1: [String] = []
        for item in arr1 {
            map1.append(getBinary(decimal: item))
        }
        
        var map2: [String] = []
        for item in arr2 {
            map2.append(getBinary(decimal: item))
        }
        
        for i in 0..<n {
            answer.append(getSharpString(map1[i], map2[i]))
        }
        
        return answer
    }
    
    func getBinary(decimal: Int) -> String {
        return preAppendZero(String(decimal, radix: 2))
    }
    
    func preAppendZero(_ inputed: String) -> String {
        var returnValue: String = ""
        for _ in 0..<(size - inputed.count) {
            returnValue = returnValue.appending("0")
        }
        returnValue.append(inputed)
        return returnValue
    }
    
    func getSharpString(_ line1: String, _ line2: String) -> String {
        var returnValue: String = ""
        let line1Arr = Array(line1)
        let line2Arr = Array(line2)
        for i in 0..<size {
            if line1Arr[i] == "0" && line2Arr[i] == "0" {
                returnValue = returnValue.appending(" ")
            } else {
                returnValue = returnValue.appending("#")
            }
        }
        return returnValue
    }
    
}

